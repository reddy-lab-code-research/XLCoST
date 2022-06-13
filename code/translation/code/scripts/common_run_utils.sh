#!/usr/bin/env bash

export PYTHONIOENCODING=utf-8;
CURRENT_DIR=`pwd`
CODE_DIR_HOME=`realpath ..`;
evaluator_script="${CODE_DIR_HOME}/evaluator";
codebleu_path="${CODE_DIR_HOME}/evaluator/CodeBLEU";
ROOT_PATH=/home/mingzhu/CodeModel/

declare -A LANG_MAP
LANG_MAP['java']='java'
LANG_MAP['python']='python'
LANG_MAP['csharp']='c_sharp'
LANG_MAP['cpp']='cpp'
LANG_MAP['c']='c'
LANG_MAP['javascript']='javascript'
LANG_MAP['php']='php'

LANG_MAP['comment']='comment'
LANG_MAP['desc']='desc'

declare -A LANG_LOWER
LANG_LOWER['Java']='java'
LANG_LOWER['Python']='python'
LANG_LOWER['C++']='cpp'
LANG_LOWER['C#']='csharp'
LANG_LOWER['C']='c'
LANG_LOWER['Javascript']='javascript'
LANG_LOWER['PHP']='php'

LANG_LOWER['comment']='comment'
LANG_LOWER['desc']='desc'

declare -A LANG_UPPER
LANG_UPPER['java']='Java'
LANG_UPPER['python']='Python'
LANG_UPPER['cpp']='C++'
LANG_UPPER['csharp']='C#'
LANG_UPPER['c']='C'
LANG_UPPER['javascript']='Javascript'
LANG_UPPER['php']='PHP'

LANG_UPPER['comment']='comment'
LANG_UPPER['desc']='desc'

declare -A FILE_EXTENSION
FILE_EXTENSION['Java']='.java'
FILE_EXTENSION['Python']='.py'
FILE_EXTENSION['C++']='.cpp'
FILE_EXTENSION['C#']='.cs'
FILE_EXTENSION['C']='.c'
FILE_EXTENSION['Javascript']='.js'
FILE_EXTENSION['PHP']='.php'

FILE_EXTENSION['comment']='.txt'
FILE_EXTENSION['desc']='.txt'

declare -a LANGS=("cpp" "java" "python" "csharp" "javascript" "php" "c")

