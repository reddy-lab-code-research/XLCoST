#!/usr/bin/env bash
root_path=/home/mingzhu/CodeModel/CodeXGLUE/Text-Code/NL-code-search-Adv/
code2codesearch_path=${root_path}code2codesearch/
nl2codesearch_path=${root_path}nl2codesearch/

declare -a langs=("C++" "Java" "Python" "C#" "Javascript" "PHP" "C")
declare -A LANG_UPPER
LANG_UPPER['java']='Java'
LANG_UPPER['python']='Python'
LANG_UPPER['cpp']='C++'
LANG_UPPER['csharp']='C#'
LANG_UPPER['c']='C'
LANG_UPPER['javascript']='Javascript'
LANG_UPPER['php']='PHP'

# bash run_code_search.sh 2 java code2code program codebert train
# bash run_code_search.sh 2 java nl2code program codebert eval
GPU=${1:-0};
SOURCE=${2:-java};
EXP=${3:-code2code};
DATA_TYPE=${4:-program};
MODEL=${5:-codebert};
IS_TRAIN=${6:-train};
export CUDA_VISIBLE_DEVICES=$GPU


pretrained_model="microsoft/codebert-base"
if [[ $MODEL == 'codebert' ]]; then
    pretrained_model="microsoft/codebert-base";
elif [[ $MODEL == 'roberta' ]]; then
    pretrained_model="roberta-base";
fi

NUM_TRAIN_EPOCHS=2;
lr=5e-5;
TRAIN_BATCH_SIZE=8;
EVAL_BATCH_SIZE=8;
GRAD_ACCUM_STEP=4; 

exp_path=$code2codesearch_path
if [[ $EXP == 'nl2code' ]]; then
    exp_path=$nl2codesearch_path
fi

data_path=${exp_path}dataset/program_level/
if [[ $DATA_TYPE == 'snippet' ]]; then
    data_path=${exp_path}dataset/snippet_level/
    TRAIN_BATCH_SIZE=16;
    EVAL_BATCH_SIZE=16;
fi
    
lang1=${LANG_UPPER[$SOURCE]}
experiment_name=$exp_path${MODEL}_${EXP}_search_${DATA_TYPE}
mkdir -p $experiment_name
outdir=$experiment_name/$lang1
mkdir -p $outdir

function train () {

python3 run.py \
    --output_dir=$outdir \
    --model_type=roberta \
    --config_name=$pretrained_model \
    --model_name_or_path=$pretrained_model \
    --tokenizer_name=$pretrained_model \
    --do_train \
    --train_data_file=$data_path$lang1/train.jsonl \
    --eval_data_file=$data_path$lang1/val.jsonl \
    --test_data_file=$data_path$lang1/test.jsonl \
    --epoch $NUM_TRAIN_EPOCHS \
    --block_size 512 \
    --train_batch_size $TRAIN_BATCH_SIZE \
    --eval_batch_size $EVAL_BATCH_SIZE \
    --learning_rate $lr \
    --max_grad_norm 1.0 \
    --evaluate_during_training \
    --seed 123456 2>&1| tee ${outdir}/train.log
}

function evaluate() {

python run.py \
    --output_dir=$outdir \
    --model_type=roberta \
    --config_name=$pretrained_model \
    --model_name_or_path=$pretrained_model \
    --tokenizer_name=$pretrained_model \
    --do_eval \
    --do_test \
    --train_data_file=$data_path$lang1/train.jsonl \
    --eval_data_file=$data_path$lang1/val.jsonl \
    --test_data_file=$data_path$lang1/test.jsonl \
    --epoch $NUM_TRAIN_EPOCHS \
    --block_size 512 \
    --train_batch_size $TRAIN_BATCH_SIZE \
    --eval_batch_size $EVAL_BATCH_SIZE \
    --learning_rate $lr \
    --max_grad_norm 1.0 \
    --evaluate_during_training \
    --seed 123456 2>&1| tee ${outdir}/test.log
}

if [[ $IS_TRAIN == 'train' ]]; then
    train;
fi

evaluate;