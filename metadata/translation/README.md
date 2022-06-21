### Translation

The file tree below describes the structure of the translation data. It is divided into two directories, ```pair_data_tok_1``` for snippet level translation and ```pair_data_tok_full``` for program level translation. Each sub task contains 21 directories for each possible language pair. The same pairs can be used with the ```src``` and ```trg``` languages switched to perform the experiments for the opposing pairs.

```
XLCoST_data
|
├── pair_data_tok_1
│   ├── C++-C
│   ├── C++-C#
│   ├── C++-Javascript
│   ├── C++-PHP
│   ├── C++-Python
│   ├── C-C#
│   ├── C-Javascript
│   ├── C-PHP
│   ├── C-Python
│   ├── Java-C
│   ├── Java-C#
│   ├── Java-C++
│   ├── Java-Javascript
│   ├── Java-PHP
│   ├── Java-Python
│   ├── Javascript-C#
│   ├── Javascript-PHP
│   ├── PHP-C#
│   ├── Python-C#
│   ├── Python-Javascript
│   └── Python-PHP
├── pair_data_tok_full
    ├── C++-C
    ├── C++-C#
    ├── C++-Javascript
    ├── C++-PHP
    ├── C++-Python
    ├── C-C#
    ├── C-Javascript
    ├── C-PHP
    ├── C-Python
    .
    .
    .
    .
    21 directories
```

Each language pair directory contains the ```train``` ```test``` and ```val``` splits of the code data. The ```map.jsonl``` files contain a line by line mapping of the ```problem_id``` to the lines in the corresponding code files. These relationships and file structures remain exactly the same for ```pair_data_tok_full``` (program level) translation, the only difference being that instead of code snippets, they contain full programs.
```
pair_data_tok_1
├── C++-C
    ├── test-C++-C-tok.c
    ├── test-C++-C-tok.cpp
    ├── test-C++-map.jsonl
    ├── test-C-map.jsonl
    ├── train-C++-C-tok.c
    ├── train-C++-C-tok.cpp
    ├── train-C++-map.jsonl
    ├── train-C-map.jsonl
    ├── val-C++-C-tok.c
    ├── val-C++-C-tok.cpp
    ├── val-C++-map.jsonl
    └── val-C-map.jsonl
```
