root_path=../
code2codesearch_path=${root_path}code2codesearch/
nl2codesearch_path=${root_path}nl2codesearch/

declare -a langs=("C++" "Java" "Python" "C#" "Javascript" "PHP" "C")
declare -a models=("codebert" "roberta")
declare -a datatypes=("snippet" "program")

function run() {
for datatype in "${datatypes[@]}"; do
    echo datatype
    data_folder=${data_path}${datatype}_level/
    for model in "${models[@]}"; do
        exp_name=${model}_${exp}_search_${datatype}
        echo exp_name
        for lang1 in "${langs[@]}"; do
            echo $lang1
            python3 ${evaluator_path}evaluator.py -a ${data_folder}$lang1/test.jsonl  -p ${exp_path}${exp_name}/$lang1/predictions.jsonl 
        done
    done
done
}

exp=code2code
exp_path=${code2codesearch_path}
data_path=${exp_path}dataset/
evaluator_path=${exp_path}evaluator/

run;

exp=nl2code
exp_path=${nl2codesearch_path}
data_path=${exp_path}dataset/
evaluator_path=${exp_path}evaluator/
run;


