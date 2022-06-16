# XLCoST: A Benchmark Dataset for Cross-lingual Code Intelligence


## Introduction
Recent advances in machine learning have benefited a number of code related tasks, such as code translation, code summarization, and code synthesis. Open-source code repository websites like Github provide enormous amount of source code data, which enables the training of large-scale code language models such as CodeBERT (Feng et al., 2020), PLBART (Ahmad et al., 2021a), TransCoder (Roziere et al., 2020) and CodeT5 (Wang et al., 2021). Although the open-source code data is abundant in quantity, it has several disadvantages when serving as training data for code-related models. First, most of the available code data is unlabeled. For tasks like Code Translation, Code Summarization, and Code Synthesis, high quality parallel data is critical for model training. 


We introduce XLCoST , a machine learning benchmark dataset that contains fine-grained parallel data in 7 commonly used programming languages (C++, Java, Python, C#, Javascript, PHP, C), and natural language (English). The data is parallel across 7 languages, at both code snippet level and program level. This means that given a program in one language, the dataset contains the same program in up to 6 other programming languages. Each program is divided into several code snippets, and programs in all the languages are aligned at the snippet level. Moreover, each of the snippets is accompanied with a comment, and the comment for a particular snippet is the same across all the languages.

The figure below shows a schematic diagram of how the dataset is organised and the possible tasks that can be performed with it.
<p align="center">
  <img width="650" height="300" src="https://github.com/reddy-lab-code-research/XLCoST/blob/main/xlcost_schematic.png">
</p>

## Tasks

We introduce the following 10 cross-lingual tasks. All the tasks have pairwise data at both snippet-level and program-level in 7 programming languages, C++, Java, Python, C\#, Javascript, PHP, and C. The tasks can be divided into two categories, generation and retrieval. The generation tasks include Code Translation, Code Summarization and Code Syntheis; the retrieval tasks include NL (natural language) Code Search and XL (Cross-Lingual) Code Search. All the tasks are in both snippet-level and program-level. We use 3 state-of-the-art baselines for the generation tasks and 2 for the retrieval tasks.

| **Category**   |                    | **Task**                  | **Data**     | **Description**                                             | **Baselines**                     |
|----------------|--------------------|---------------------------|--------------|-------------------------------------------------------------|-----------------------------------|
| **Generation** | [**Code-to-Code**](https://github.com/reddy-lab-code-research/XLCoST/tree/main/code/translation)   | Snippet Translation       | 872K/47K/83K | Translate code snippet across programming languages         | CodeBERT(enc-dec), PLBART, CodeT5 |
|                |                    | Program Translation       | 106K/6K/11K  | Translate program across programming languages              |                                   |
|                | **Code-to-Text**   | Snippet Summarization     | 446K/22K/41K | Generate comment for given code snippet                     |                                   |
|                |                    | Program Summarization     | 50K/3K/5K    | Generate problem description for given program              |                                   |
|                | **Text-to-Code**   | Snippet Synthesis         | 446K/22K/41K | Generate code snippet giving comment                        |                                   |
|                |                    | Program Synthesis         | 50K/3K/5K    | Generate program giving problem description and comments    |                                   |
| **Retrieval**  | [**NL Code Search**](https://github.com/reddy-lab-code-research/XLCoST/tree/main/code/codesearch) | Comment-to-Snippet Search | 446K/22K/41K | Retrieve code snippet for given comment                     | RoBERTa, CodeBERT                 |
|                |                    | Problem-to-Program Search | 50K/3K/5K    | Retrieve program for given problem description              |                                   |
|                | [**XL Code Search**](https://github.com/reddy-lab-code-research/XLCoST/tree/main/code/codesearch) | Snippet-to-Snippet Search | 872K/47K/83K | Retrieve code snippets in other languages for given snippet |                                   |
|                |                    | Program-to-Program Search | 106K/6K/11K  | Retrieve programs in other languages for given snippet      |                                   |

## Data

The data can be downloaded [here](https://drive.google.com/file/d/10GaFasuLllexWbiH_oCgWKWXv_fFSkUY/view?usp=sharing).

## Statistics
Some basic averaged statistics of the dataset are presented below. "#" means number. #comments/program is the same as
#snippets/program. (Py is short for Python; JS for Javascript; TOK for tokens; SN for snippets; PR
for programs; com for comments;)
|                       | **C++** | **Java** | **C#** | **Python** | **JS** | **PHP** | **C**  | **Avg** |
|-----------------------|---------|----------|--------|------------|--------|---------|--------|---------|
| **# tokens/snippet**  |   21.52 |     24.1 |  21.63 |      23.06 |  22.52 |   28.14 |  25.37 |   22.83 |
| **# tokens/program**  |  204.97 |   227.09 | 188.54 |     215.29 | 184.63 |  163.51 | 197.95 |  201.96 |
| **# tokens/comment**  |    8.25 |     8.14 |   7.97 |       8.23 |   7.96 |    8.45 |   9.67 |    8.15 |
| **# tokens/desc**     |   10.68 |    10.67 |  10.75 |       10.7 |  10.87 |    9.91 |   8.19 |   10.66 |
| **# snippet/program** |    9.52 |     9.42 |   8.51 |       9.33 |    8.2 |    5.81 |   7.77 |    8.81 |
| **# lines/snippet**   |    3.41 |     3.71 |   2.41 |       3.82 |   3.23 |       4 |   4.05 |    3.37 |
| **# lines/program**   |   32.45 |    34.93 |  20.54 |      35.64 |  26.47 |   23.23 |   31.5 |   29.71 |
| **total snippets**    | 106,397 |  103,703 | 92,446 |    100,032 | 81,511 |  20,639 |  4,363 | -       |
| **total programs**    |   11,198|   11,028 | 10,622 |     10,735 |  9,951 |   3,553 |    574 | -       |


Number of pairwise code-code data in training, validation and testing splits for each language-pair are presented in the following table. The upper triangle shows the number of parallel code snippets, and the lower triangle shows the number of parallel programs. This data is used for the Code Translation and XL Code Search tasks. (Py is short for Python. JS is short for Javascript.)
|**Code-Code Pairs**|       | C++  | Java  | Python | C#    | JS    | PHP   | C    |
|--------|-------|------|-------|--------|-------|-------|-------|------|
| C++    | train |      |89,040 | 80,100 |85,662 |69,507 |17,811 |3,386 |
|        | val   |      | 4,419 |  3,913 | 4,408 | 3,808 |   923 |  352 |
|        | test  |      | 8,059 |  7,228 | 7,922 | 6,965 | 1,647 |  222 |
| Java   | train |9,450 |       | 77,759 |87,065 |69,341 |17,853 |2,996 |
|        | val   |  490 |       |  3,938 | 4,437 | 3,826 |   929 |  353 |
|        | test  |  901 |       |  7,259 | 8,011 | 7,005 | 1,672 |  238 |
| Python | train |9,139 | 8,991 |        |75,843 |67,219 |17,616 |2,478 |
|        | val   |  468 |   471 |        | 3,922 | 3,750 |   923 |  311 |
|        | test  |  878 |   882 |        | 7,215 | 6,861 | 1,655 |  203 |
| C#     | train |9,187 | 9,301 |  8,826 |       |68,093 |17,873 |2,958 |
|        | val   |  488 |   491 |    470 |       | 3,826 |   928 |  352 |
|        | test  |  890 |   898 |    877 |       | 6,961 | 1,668 |  238 |
| JS     | train |8,482 | 8,470 |  8,182 | 8,367 |       |17,117 |1,875 |
|        | val   |  472 |   475 |    459 |   475 |       |   921 |  309 |
|        | test  |  878 |   881 |    864 |   877 |       | 1,617 |  200 |
| PHP    | train |3,056 |  3,68 |  3,003 | 3,071 | 2,971 |       |  856 |
|        | val   |  157 |   158 |    153 |   158 |   157 |       |  271 |
|        | test  |  303 |   307 |    304 |   307 |   302 |       |  183 |
| C      | train |  402 |   409 |    380 |   394 |   308 |   170 |      |
|        | val   |   59 |    59 |     59 |    59 |    59 |    55 |      |
|        | test  |   45 |    49 |     48 |    49 |    49 |    43 |      |


Number of pairwise code-text data in each language are presented in the table below. "Snippet" means snippet-comment pairs, and "Program" means program-description (problem description) pairs. This data is used for Code Summarization (Code-to-Text), Code Synthesis (Text-to-Code) and NL Code Search tasks.
| **NL-Code Pairs** |       | **C++** | **Java** | **Python** | **C#** | **JS** | **PHP** | **C** | **Total** |
|:----------:|:-----:|:-------:|:--------:|:----------:|:------:|:------:|:-------:|:-----:|:---------:|
| **Snippet**| train | 93,847  |  91,089  |   81,207   | 87,583 | 70,649 | 18,027  | 3,763 |   446,165  |
|            | valid |  4,432  |  4,460   |   3,946    | 4,436  | 3,829  |   930   |  350  |   22,383   |
|            |  test |  8,118  |  8,154   |   7,293    | 8,013  | 7,033  |  1,682  |  250  |   40,543   |
| **Program**| train |  9,797  |  9,623   |   9,263    | 9,345  | 8,590  |  3,087  |  463  |   50,168   |
|            | valid |   492   |    494   |     472    |   491  |   475  |   158   |   60  |    2,642   |
|            |  test |   909   |    911   |     887    |   899  |   886  |   308   |   51  |    4,851   |


With the release of this dataset hope to enable more research into the domain of Deep Learning for Software Engineering tasks. We believe that this dataset is a valuable asset for the research community and can potentially benefit a number of code-related research problems.

<!-- ### Code Translation

<!-- #### Snippet Level -->

<!-- | **CodeBLEU** | **Model**      | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**     |
|--------------|----------------|-----------|-----------|------------|-----------|-----------|-----------|-----------|
| **C++**      | **Naive Copy** | -         |     64.56 |      34.79 |     63.19 |     53.16 |     42.56 |      84.2 |
|              | **CodeBERT**   | -         |     84.94 |      74.55 |     84.99 |     82.79 |     68.56 |     45.46 |
|              | **PLBART**     | -         |     83.85 |      74.89 |     84.57 |     83.19 |     68.62 |     83.95 |
|              | **CodeT5**     | **-**     | **86.35** |  **76.28** | **85.85** | **84.31** | **69.87** | **90.45** |
| **Java**     | **Naive Copy** |     70.85 | -         |         35 |     78.43 |     57.81 |     42.49 |     69.74 |
|              | **CodeBERT**   |     87.27 | -         |      58.39 |     92.26 |     84.63 |     67.26 |     39.94 |
|              | **PLBART**     |     87.31 | -         |       58.3 |     90.78 |     85.42 |     67.44 |     72.47 |
|              | **CodeT5**     | **88.26** | **-**     |  **74.59** | **92.56** | **86.22** | **69.02** | **82.78** |
| **Python**   | **Naive Copy** |     39.22 |     31.89 | -          |     31.79 |     38.34 |     36.02 |     37.79 |
|              | **CodeBERT**   |     80.46 |      58.5 | -          |     54.72 |     57.38 |     65.14 |      10.7 |
|              | **PLBART**     |     80.15 |     74.15 | -          |      73.5 |      73.2 |     66.12 |     62.15 |
|              | **CodeT5**     | **81.56** | **78.61** | **-**      | **78.89** | **77.76** | **67.54** | **68.67** |
| **C#**       | **Naive Copy** |     69.78 |     78.71 |      34.77 | -         |     57.85 |     42.53 |     66.73 |
|              | **CodeBERT**   |     86.96 |     90.15 |      56.92 | -         |     84.38 |     67.18 |     40.43 |
|              | **PLBART**     |     84.98 |      6.27 |      69.82 | -         |     85.02 |      67.3 |     75.74 |
|              | **CodeT5**     | **88.06** | **91.69** |  **73.85** | **-**     | **85.95** | **68.97** | **81.09** |
| **JS**       | **Naive Copy** |     60.82 |     59.25 |      38.84 |     64.27 | -         |     41.56 |     55.84 |
|              | **CodeBERT**   |     84.38 |     84.42 |      52.57 |     84.74 | -         |     66.66 |     33.29 |
|              | **PLBART**     |     84.45 |      84.9 |      69.29 |     85.05 | -         |     67.09 |     72.65 |
|              | **CodeT5**     | **85.06** | **85.48** |  **73.15** | **85.96** | **-**     | **68.42** | **80.49** |
| **PHP**      | **Naive Copy** |     36.33 |     35.61 |      24.62 |     36.67 |     35.55 | -         |     35.95 |
|              | **CodeBERT**   |     82.58 |     81.57 |      69.29 |     80.96 |     79.94 | -         |     28.45 |
|              | **PLBART**     |     83.87 |     81.66 |      71.17 |        78 |     82.94 | -         |     57.39 |
|              | **CodeT5**     | **86.33** | **85.12** |  **73.22** | **84.56** | **83.56** | **-**     |  **79.3** |
| **C**        | **Naive Copy** |     83.93 |     65.46 |      38.49 |     63.05 |     55.55 |     41.85 | -         |
|              | **CodeBERT**   |     45.84 |     39.69 |      13.55 |     39.71 |     29.85 |     38.88 | -         |
|              | **PLBART**     |     82.53 |     72.35 |      49.16 |     75.78 |     75.05 |     60.86 | -         |
|              | **CodeT5**     | **90.26** | **81.81** |  **63.81** | **83.05** | **79.73** | **66.32** | **-**     |
 -->

<!-- #### Program Level

| **CodeBLEU** | **Model**      | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**     |
|--------------|----------------|-----------|-----------|------------|-----------|-----------|-----------|-----------|
| **C++**      | **Naive Copy** | -         |     57.36 |      17.68 |     58.02 |     53.16 |     18.97 |     75.91 |
|              | **CodeBERT**   | -         |     74.73 |      24.96 |     76.35 |     72.95 |      50.4 |     21.84 |
|              | **PLBART**     | -         |     75.26 |      70.13 |     78.01 |     61.85 |     67.01 |     72.59 |
|              | **CodeT5**     | **-**     | **80.03** |  **71.56** | **81.73** | **79.48** | **70.44** | **85.67** |
| **Java**     | **Naive Copy** |     64.25 | -         |      39.87 |     72.68 |     57.81 |     42.51 |     62.48 |
|              | **CodeBERT**   |     79.36 | -         |       8.51 |     84.43 |     76.02 |     51.42 |     21.22 |
|              | **PLBART**     |     81.41 | -         |      66.29 |     83.34 |     80.14 |     67.12 |     63.37 |
|              | **CodeT5**     |     84.26 | -         |      69.57 |     87.79 |     80.67 |     69.44 |     78.78 |
| **Python**   | **Naive Copy** |     37.47 |     29.78 | -          |     27.59 |     38.42 |     35.48 |     35.66 |
|              | **CodeBERT**   |     68.87 |     28.22 | -          |      17.8 |     23.65 |      49.3 |     18.32 |
|              | **PLBART**     |     74.38 |      67.8 | -          |     66.03 |      69.3 |     64.85 |     29.05 |
|              | **CodeT5**     | **78.85** | **73.15** | **-**      | **73.35** |  **71.8** |  **67.5** | **56.35** |
| **C#**       | **Naive Copy** |        64 |     73.63 |      40.09 | -         |     57.79 |     42.96 |     60.87 |
|              | **CodeBERT**   |     78.52 |     82.25 |      10.82 | -         |     75.46 |     51.76 |     21.63 |
|              | **PLBART**     |     80.17 |     81.37 |      67.02 | -         |     79.81 |     67.12 |      57.6 |
|              | **CodeT5**     | **83.59** |  **85.7** |  **69.52** | **-**     |  **80.5** | **69.63** | **77.35** |
| **JS**       | **Naive Copy** |     53.81 |     51.77 |      42.31 |     54.86 | -         |     42.11 |     49.04 |
|              | **CodeBERT**   |     75.43 |     72.33 |       9.19 |     75.47 | -         |     52.08 |     19.79 |
|              | **PLBART**     |     80.19 |     76.96 |      64.18 |     78.51 | -         |     67.24 |      67.7 |
|              | **CodeT5**     | **82.14** | **79.91** |  **68.42** | **81.77** | **-**     | **68.76** | **74.57** |
| **PHP**      | **Naive Copy** |     34.62 |     31.33 |      25.68 |     32.81 |     32.26 | -         |     33.45 |
|              | **CodeBERT**   |     50.13 |     46.81 |      16.92 |     49.75 |     48.12 | -         |     22.19 |
|              | **PLBART**     |      79.4 |     72.77 |      61.26 |     74.16 |     44.26 | -         |     56.23 |
|              | **CodeT5**     | **85.55** | **82.09** |  **72.26** | **83.79** | **81.72** | **-**     | **65.86** |
| **C**        | **Naive Copy** |      78.4 |     59.41 |       20.2 |     59.83 |     53.54 |     19.75 | -         |
|              | **CodeBERT**   |      21.7 |     21.27 |       21.1 |      19.5 |     15.64 |     31.71 | -         |
|              | **PLBART**     |     78.42 |     13.45 |       5.53 |     45.15 |     31.47 |     25.17 | -         |
|              | **CodeT5**     | **88.17** | **76.12** |  **56.32** |  **80.2** |  **76.5** | **64.28** | **-**     |
 -->


### Code Synthesis

#### Snippet Level
| **CodeBLEU**       | **Model**    | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**     |
|--------------------|--------------|-----------|-----------|------------|-----------|-----------|-----------|-----------|
| **Code Synthesis** | **CodeBERT** |      22.7 |     25.53 |      12.26 |     23.44 |     23.87 |     36.47 |     10.63 |
|                    | **PLBART**   |     34.89 |     32.23 |       4.62 |     29.36 |     29.63 | **37.56** | **22.88** |
|                    | **CodeT5**   | **35.48** | **33.51** |   **21.1** | **30.64** | **29.99** |     36.37 |     21.93 |


#### Program Level

| **CodeBLEU**       | **Model**    | **C++**   | **Java**  | **Python** | **C#**   | **JS**    | **PHP**   | **C**     |
|--------------------|--------------|-----------|-----------|------------|----------|-----------|-----------|-----------|
| **Code Synthesis** | **CodeBERT** |     26.51 |     31.14 |       24.5 |    33.37 |     29.09 |     39.84 |     18.08 |
|                    | **PLBART**   |     44.09 |     41.55 |      33.77 |     40.7 |     38.33 |     43.01 |      6.72 |
|                    | **CodeT5**   | **45.18** | **42.73** |  **35.02** | **43.6** | **38.66** | **45.02** | **34.88** |

### Code Summarization
#### Snippet Level

| **BLEU**               | **Model**    | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**   |
|------------------------|--------------|-----------|-----------|------------|-----------|-----------|-----------|---------|
| **Code Summarization** | **CodeBERT** |      14.4 |     13.13 |       3.96 |     14.07 |     11.81 |     11.25 |    5.84 |
|                        | **PLBART**   |     14.77 |     13.76 |          8 |     14.37 |     10.93 |      9.07 | **7.5** |
|                        | **CodeT5**   | **17.36** | **16.69** |  **10.76** | **17.44** | **14.34** | **13.42** |    6.63 |

#### Program Level

| **BLEU**               | **Model**    | **C++**  | **Java** | **Python** | **C#**   | **JS**   | **PHP**  | **C**     |
|------------------------|--------------|----------|----------|------------|----------|----------|----------|-----------|
| **Code Summarization** | **CodeBERT** |     7.68 |     5.47 |       2.04 |     7.58 |     7.67 |      7.5 |      6.64 |
|                        | **PLBART**   |     7.65 |     6.35 |       4.86 | **9.23** |     6.78 |     6.03 |      4.14 |
|                        | **CodeT5**   | **9.62** | **8.82** |   **6.32** |     7.75 | **8.23** | **10.5** | **12.84** |

<!-- ### Code Search

#### Snippet Level
| **MRR**            | **Model**    | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**     |
|--------------------|--------------|-----------|-----------|------------|-----------|-----------|-----------|-----------|
| **NL Code Search** | **RoBERTa**  |     25.77 |     25.85 |      27.08 |     25.64 |     26.78 |     33.47 |     36.14 |
|                    | **CodeBERT** | **29.77** | **29.41** |  **30.94** | **29.08** |  **31.2** | **38.75** | **41.56** |
| **XL Code Search** | **RoBERTa**  |     41.73 |     41.25 |      36.16 |     41.18 |     43.17 | **41.17** |      37.1 |
|                    | **CodeBERT** | **42.11** | **41.71** |  **36.98** | **41.52** | **43.41** |     41.09 | **37.87** | -->

<!-- #### Program Level
| **MRR**            | **Model**    | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**     |
|--------------------|--------------|-----------|-----------|------------|-----------|-----------|-----------|-----------|
| **NL Code Search** | **RoBERTa**  |     51.47 |      50.4 |      48.98 |     52.24 |     50.05 |     62.01 | **56.34** |
|                    | **CodeBERT** | **59.13** | **56.07** |  **57.97** | **56.65** | **54.37** | **65.13** |     47.13 |
| **XL Code Search** | **RoBERTa**  |     48.28 |     47.66 |      46.11 |      46.4 |      47.6 |     43.76 |     40.15 |
|                    | **CodeBERT** | **48.71** | **48.33** |  **47.24** | **47.96** | **47.66** | **44.02** | **40.43** |
 -->
