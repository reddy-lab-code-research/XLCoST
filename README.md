# XLCoST


Basic statistics of the dataset. "#" means number. #comments/program is the same as
#snippets/program. (Py is short for Python; JS for Javascript; TOK for tokens; SN for snippets; PR
for programs; com for comments;)

|            |   C++        | Java          | Py          | C#           | JS          | PHP          | C          | Avg          |
|------------|--------------|---------------|-------------|--------------|-------------|--------------|------------|--------------|
| \#TOK/SN   | 21.52        | 24.1          | 21.63       | 23.06        | 22.52       | 28.14        | 25.37      | 22.83        |
| \#TOK/PR   | 204.97       | 227.09        | 185.21      | 215.29       | 184.63      | 163.51       | 197.95     | 201.29       |
| \#TOK/com  | 8.25         | 8.14          | 7.97        | 8.23         | 7.96        | 8.45         | 9.67       | 8.15         |
| \#TOK/desc | 10.68        | 10.67         | 10.74       | 10.7         | 10.87       | 9.91         | 8.19       | 10.66        |
| \#SN/PR    | 9.52         | 9.42          | 8.57        | 9.33         | 8.2         | 5.81         | 7.77       | 8.82         |
| \#lines/SN | 3.41         | 3.71          | 2.41        | 3.82         | 3.23        | 4            | 4.05       | 3.37         |
| \#lines/PR | 32.45        | 34.93         | 20.66       | 35.64        | 26.47       | 23.23        | 31.5       | 29.71        |
| total SN   | 106631       | 103896        | 92691       | 100190       | 81603       | 20648        | 4461       | -            |
| total PR   | 11198        | 11028         | 10813       | 10735        | 9951        | 3553         | 574        | -            |



|**Code-Code Pairs**|       | C++  | Java  | Python | C#    | JS    | PHP   | C    |
|--------|-------|------|-------|--------|-------|-------|-------|------|
| C++    | train |      | 89040 |  80100 | 85662 | 69507 | 17811 | 3386 |
|        | val   |      |  4419 |   3913 |  4408 |  3808 |   923 |  352 |
|        | test  |      |  8059 |   7228 |  7922 |  6965 |  1647 |  222 |
| Java   | train | 9450 |       |  77759 | 87065 | 69341 | 17853 | 2996 |
|        | val   |  490 |       |   3938 |  4437 |  3826 |   929 |  353 |
|        | test  |  901 |       |   7259 |  8011 |  7005 |  1672 |  238 |
| Python | train | 9139 |  8991 |        | 75843 | 67219 | 17616 | 2478 |
|        | val   |  468 |   471 |        |  3922 |  3750 |   923 |  311 |
|        | test  |  878 |   882 |        |  7215 |  6861 |  1655 |  203 |
| C#     | train | 9187 |  9301 |   8826 |       | 68093 | 17873 | 2958 |
|        | val   |  488 |   491 |    470 |       |  3826 |   928 |  352 |
|        | test  |  890 |   898 |    877 |       |  6961 |  1668 |  238 |
| JS     | train | 8482 |  8470 |   8182 |  8367 |       | 17117 | 1875 |
|        | val   |  472 |   475 |    459 |   475 |       |   921 |  309 |
|        | test  |  878 |   881 |    864 |   877 |       |  1617 |  200 |
| PHP    | train | 3056 |  3068 |   3003 |  3071 |  2971 |       |  856 |
|        | val   |  157 |   158 |    153 |   158 |   157 |       |  271 |
|        | test  |  303 |   307 |    304 |   307 |   302 |       |  183 |
| C      | train |  402 |   409 |    380 |   394 |   308 |   170 |      |
|        | val   |   59 |    59 |     59 |    59 |    59 |    55 |      |
|        | test  |   45 |    49 |     48 |    49 |    49 |    43 |      |


| **NL-Code Pairs** |       | **C++** | **Java** | **Python** | **C#** | **JS** | **PHP** | **C** | **Total** |
|:----------:|:-----:|:-------:|:--------:|:----------:|:------:|:------:|:-------:|:-----:|:---------:|
| **Snippet**| train |  93847  |   91089  |    81207   |  87583 |  70649 |  18027  |  3763 |   446165  |
|            | valid |   4432  |   4460   |    3946    |  4436  |  3829  |   930   |  350  |   22383   |
|            |  test |   8118  |   8154   |    7293    |  8013  |  7033  |   1682  |  250  |   40543   |
| **Program**| train |   9797  |   9623   |    9263    |  9345  |  8590  |   3087  |  463  |   50168   |
|            | valid |   492   |    494   |     472    |   491  |   475  |   158   |   60  |    2642   |
|            |  test |   909   |    911   |     887    |   899  |   886  |   308   |   51  |    4851   |



### Code Translation

#### Snippet Level

| **CodeBLEU** | **Model**      | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**     |
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


#### Program Level

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

### Code Search

#### Snippet Level
| **MRR**            | **Model**    | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**     |
|--------------------|--------------|-----------|-----------|------------|-----------|-----------|-----------|-----------|
| **NL Code Search** | **RoBERTa**  |     25.77 |     25.85 |      27.08 |     25.64 |     26.78 |     33.47 |     36.14 |
|                    | **CodeBERT** | **29.77** | **29.41** |  **30.94** | **29.08** |  **31.2** | **38.75** | **41.56** |
| **XL Code Search** | **RoBERTa**  |     41.73 |     41.25 |      36.16 |     41.18 |     43.17 | **41.17** |      37.1 |
|                    | **CodeBERT** | **42.11** | **41.71** |  **36.98** | **41.52** | **43.41** |     41.09 | **37.87** |

#### Program Level
| **MRR**            | **Model**    | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**     | **PHP**   | **C**     |
|--------------------|--------------|-----------|-----------|------------|-----------|-----------|-----------|-----------|-----------|-----------|
| **NL Code Search** | **RoBERTa**  |     51.47 |      50.4 |      48.98 |     52.24 |     50.05 |     62.01 |     56.34 |     62.01 | **56.34** |
|                    | **CodeBERT** | **59.13** | **56.07** |  **57.97** | **56.65** | **54.37** | **65.13** | **47.13** | **65.13** |     47.13 |
| **XL Code Search** | **RoBERTa**  |     48.28 |     47.66 |      46.11 |      46.4 |      47.6 |     43.76 |     40.15 |     43.76 |     40.15 |
|                    | **CodeBERT** | **48.71** | **48.33** |  **47.24** | **47.96** | **47.66** | **44.02** | **40.43** | **44.02** | **40.43** |