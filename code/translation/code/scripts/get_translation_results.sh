#!/usr/bin/env bash

source common_run_utils.sh
PATH_DATA_PREFIX=${ROOT_PATH}g4g/XLCoST_data/

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

# For CodeXGLUE
if [[ $DATA_TYPE == 'codexglue' ]]; then
    PATH_2_DATA=${PATH_DATA}
    LANG_PAIR=$SOURCE_LANG-$TARGET_LANG
    TRAIN_FILE_SRC=$PATH_2_DATA/train-$LANG_PAIR-tok${FILE_EXTENSION[$SOURCE_LANG]}
    echo $TRAIN_FILE_SRC
    if [ ! -f $TRAIN_FILE_SRC ] 
    then
        LANG_PAIR=$TARGET_LANG-$SOURCE_LANG
    fi
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

cd $codebleu_path;
python calc_code_bleu.py \
    --ref $TEST_FILE_TGT \
    --hyp $SAVE_DIR/test_0.output \
    --lang ${LANG_MAP[$TARGET]} \
    2>&1 | tee -a $RESULT_FILE;
cd $CURRENT_DIR;

}

function run(){
for MODEL in "${MODELS[@]}"
do
    experiment_name=${MODEL}_translation_${EXP_SUFFIX}
    RESULT_FILE=${CURRENT_DIR}/experiments/results/${experiment_name}.txt;
#     RESULT_FILE=${CURRENT_DIR}/${MODEL}_codebleu_${DATA_TYPE}.txt;
    rm $RESULT_FILE
    for SOURCE in "${LANGS[@]}"
    do
        for TARGET in "${LANGS[@]}"
        do
            if [[ "$SOURCE" == "$TARGET" ]]; then
                continue
            fi
            echo $SOURCE, $TARGET
        echo ${LANG_UPPER[$SOURCE]}, ${LANG_UPPER[$TARGET]} >> ${RESULT_FILE}
        evaluate;
        done
    done
done
}

# snippet results on xlcost
function snippet() {
DATA_TYPE=snippet
PATH_DATA=${PATH_DATA_PREFIX}pair_data_tok_1/;
EXP_SUFFIX=$DATA_TYPE
run;
}

# program results on xlcost
function program() {
DATA_TYPE=program
PATH_DATA=${PATH_DATA_PREFIX}pair_data_tok_full/;
EXP_SUFFIX=$DATA_TYPE
run;
}

# snippet-program transfer results on xlcost
function snippet_program() {
DATA_TYPE=program
PATH_DATA=${PATH_DATA_PREFIX}pair_data_tok_full/;
EXP_SUFFIX=transfer_$DATA_TYPE
run;
}

function codexglue() {
DATA_TYPE=codexglue
LANGS=("java" "csharp")
PATH_DATA=${ROOT_PATH}g4g/codeXglue_data;
EXP_TYPE=$DATA_TYPE
run;
}

function codexglue_transfer() {
DATA_TYPE=codexglue
LANGS=("java" "csharp")
EXP_TYPE=transfer_${DATA_TYPE}
}

function snippet_codexglue() {
TRANSFER_TYPE=snippet
EXP_SUFFIX=${EXP_TYPE}${EXP_KEY}_${TRANSFER_TYPE}
run;
}
function program_codexglue() {
TRANSFER_TYPE=program
EXP_SUFFIX=${EXP_TYPE}${EXP_KEY}_${TRANSFER_TYPE}
run;
}
function snippet_program_codexglue() {
TRANSFER_TYPE=snippet_program
EXP_SUFFIX=${EXP_TYPE}_${EXP_KEY}_${TRANSFER_TYPE}
run;
}

# snippet;
# program;
# snippet_program;
# codexglue_tok;
# codexglue;

# codexglue_transfer;
# PATH_DATA=${ROOT_PATH}g4g/codeXglue_data_new;
# EXP_KEY=_new_30
# snippet_codexglue;
# program_codexglue;
# snippet_program_codexglue;

codexglue_transfer;
PATH_DATA=${ROOT_PATH}g4g/codeXglue_data;
snippet_codexglue;
program_codexglue;
# snippet_program_codexglue;

