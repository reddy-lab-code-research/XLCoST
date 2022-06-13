#!/usr/bin/env bash

source common_run_utils.sh
PATH_DATA_PREFIX=${ROOT_PATH}g4g/XLCoST_data/

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

python $evaluator_script/evaluator.py \
    --references $TEST_FILE_TGT \
    --predictions $TEST_FILE_SRC \
    2>&1 | tee -a $RESULT_FILE;

cd $codebleu_path;
python calc_code_bleu.py \
    --ref $TEST_FILE_TGT \
    --hyp $TEST_FILE_SRC \
    --lang ${LANG_MAP[$TARGET]} \
    2>&1 | tee -a $RESULT_FILE;
cd $CURRENT_DIR;
}

function run(){
RESULT_FILE=${CURRENT_DIR}/experiments/results/naivecopy_translation_${DATA_TYPE}.txt;

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
}

DATA_TYPE=snippet
PATH_DATA=${PATH_DATA_PREFIX}pair_data_tok_1/;
run;

DATA_TYPE=program
PATH_DATA=${PATH_DATA_PREFIX}pair_data_tok_full/;
run;
