#!/usr/bin/env bash

source common_run_utils.sh
PATH_DATA_PREFIX=${ROOT_PATH}g4g/XLCoST_data/
declare -a TEXTS=("comment" "desc")
declare -a MODELS=("codebert" "plbart" "codet5")

function evaluate() {
SOURCE_LANG=${LANG_UPPER[$SOURCE]}
TARGET_LANG=${LANG_UPPER[$TARGET]}
LANG_PAIR=$SOURCE_LANG-$TARGET_LANG
PATH_2_DATA=${PATH_DATA}${LANG_PAIR}

if [ ! -d $PATH_2_DATA ] 
then
    LANG_PAIR=$TARGET_LANG-$SOURCE_LANG
    PATH_2_DATA=${PATH_DATA}${LANG_PAIR}
fi

SRC_FILE_SUFFIX=-$LANG_PAIR-tok${FILE_EXTENSION[$SOURCE_LANG]}
TGT_FILE_SUFFIX=-$LANG_PAIR-tok${FILE_EXTENSION[$TARGET_LANG]}
TEST_FILE_SRC=$PATH_2_DATA/test$SRC_FILE_SUFFIX
TEST_FILE_TGT=$PATH_2_DATA/test$TGT_FILE_SUFFIX
echo "TEST_FILE_SRC: $TEST_FILE_SRC TEST_FILE_TGT: $TEST_FILE_TGT"

SAVE_DIR=${CURRENT_DIR}/experiments/${MODEL}/$experiment_name/$SOURCE_LANG-$TARGET_LANG

python $evaluator_script/evaluator.py \
    --references $TEST_FILE_TGT \
    --predictions $SAVE_DIR/test_0.output \
    2>&1 | tee -a $RESULT_FILE;

if [[ ! " ${TEXTS[*]} " =~ " ${TARGET} " ]]; then
    cd $codebleu_path;
    python calc_code_bleu.py \
        --ref $TEST_FILE_TGT \
        --hyp $SAVE_DIR/test_0.output \
        --lang ${LANG_MAP[$TARGET]} \
        2>&1 | tee -a $RESULT_FILE;
    cd $CURRENT_DIR;
fi

}

function run_nl_pl(){

for MODEL in "${MODELS[@]}"
do
    # NL to PL
    for SOURCE in "${TEXTS[@]}"
    do
        echo $SOURCE
        if [[ "$SOURCE" == "comment" ]];  then
            PATH_DATA=${PATH_DATA_PREFIX}pair_data_tok_1_comment/;
            experiment_name=${MODEL}_nl_pl_snippet
        elif [[ "$SOURCE" == "desc" ]]; then
            PATH_DATA=${PATH_DATA_PREFIX}pair_data_tok_full_desc_comment/; 
            experiment_name=${MODEL}_nl_pl_program
        fi
        RESULT_FILE=${CURRENT_DIR}/experiments/results/${experiment_name}.txt;
        echo $experiment_name, $RESULT_FILE
        rm $RESULT_FILE
        for TARGET in "${LANGS[@]}"
        do
            echo $SOURCE, $TARGET
            echo ${LANG_UPPER[$SOURCE]}, ${LANG_UPPER[$TARGET]} >> ${RESULT_FILE}
            evaluate;
        done
    done
done
}

function run_pl_nl(){
for MODEL in "${MODELS[@]}"
do
    # PL to NL
    for TARGET in "${TEXTS[@]}"
    do
        if [[ "$TARGET" == "comment" ]];  then
            PATH_DATA=${PATH_DATA_PREFIX}pair_data_tok_1_comment/;
            experiment_name=${MODEL}_pl_nl_snippet
        elif [[ "$TARGET" == "desc" ]]; then
            PATH_DATA=${PATH_DATA_PREFIX}pair_data_tok_full_desc/; 
            experiment_name=${MODEL}_pl_nl_program
        fi
        RESULT_FILE=${CURRENT_DIR}/experiments/results/${experiment_name}.txt;
        echo $experiment_name, $RESULT_FILE
        rm $RESULT_FILE
        for SOURCE in "${LANGS[@]}"
        do
            echo $SOURCE, $TARGET
            echo ${LANG_UPPER[$SOURCE]}, ${LANG_UPPER[$TARGET]} >> ${RESULT_FILE}
            evaluate;
        done
    done
done
}

run_nl_pl;
run_pl_nl;

