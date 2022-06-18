## Code Translation, Summarization & Synthesis

First edit the <code>code/scripts/common_run_utils.sh</code> file, change the <code>ROOT_PATH</code> to your own directory.
Then place the unzipped dataset at <code>ROOT_PATH/g4g/XLCoST_data/</code>.


To run the code-to-code translation experiments:
```
cd code/scripts
# train snippet level java-python translation on GPU 0 with CodeBERT
bash run_translation.sh 0 java python snippet codebert train
# train program level csharp-cpp translation on GPU 2 with PLBART
bash run_translation.sh 2 csharp cpp snippet plbart train
# evaluate program level csharp-cpp translation on GPU 2 with CodeT5
bash run_translation.sh 2 csharp cpp snippet codet5 train
```

To run the code-to-text and text-to-code generation experiments:
```
cd code/scripts
# train java-description program summarization on GPU 0 with CodeBERT
bash run_translation.sh 0 java desc program codebert train
# train description-java program synthesis on GPU 2 with PLBART
bash run_translation.sh 2 desc python program plbart eval
# train python-comment snippet summarization on GPU 2 with CodeT5
bash run_translation.sh 2 java comment snippet codet5 eval
# train comment-python snippet synthesis on GPU 2 with CodeT5
bash run_translation.sh 2 comment python snippet codet5 train

```

## Translation Results

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
|              | **CodeT5**     | **88.17** | **76.

