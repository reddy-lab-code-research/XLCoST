## Code Search

First edit the <code>code/run_code_search.sh</code> file, change the <code>root_path</code> to your own directory.
Then place the NL code search dataset at <code>root_path/nl2codesearch/dataset/</code>, and the XL code search dataset at <code>root_path/code2codesearch/dataset/</code>.


To run the NL code search
```
# train java desciption-to-program search on GPU 0 with codebert
bash run_code_search.sh 0 java nl2code program codebert train
# train python comment-to-snippet search on GPU 2 with PLBART
bash run_code_search.sh 2 python nl2code snippet plbart train
```

To run the XL code search
```
# train java program-to-program search on GPU 0 with codebert
bash run_code_search.sh 0 java code2code program codebert train
# train python program-to-program search on GPU 2 with CodeT5
bash run_code_search.sh 2 python code2code program codet5 train
```

## Results



#### Snippet Level
| **MRR**            | **Model**    | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**     |
|--------------------|--------------|-----------|-----------|------------|-----------|-----------|-----------|-----------|
| **NL Code Search** | **RoBERTa**  |     25.77 |     25.85 |      27.08 |     25.64 |     26.78 |     33.47 |     36.14 |
|                    | **CodeBERT** | **29.77** | **29.41** |  **30.94** | **29.08** |  **31.2** | **38.75** | **41.56** |
| **XL Code Search** | **RoBERTa**  |     41.73 |     41.25 |      36.16 |     41.18 |     43.17 | **41.17** |      37.1 |
|                    | **CodeBERT** | **42.11** | **41.71** |  **36.98** | **41.52** | **43.41** |     41.09 | **37.87** |

#### Program Level
| **MRR**            | **Model**    | **C++**   | **Java**  | **Python** | **C#**    | **JS**    | **PHP**   | **C**     |
|--------------------|--------------|-----------|-----------|------------|-----------|-----------|-----------|-----------|
| **NL Code Search** | **RoBERTa**  |     51.47 |      50.4 |      48.98 |     52.24 |     50.05 |     62.01 | **56.34** |
|                    | **CodeBERT** | **59.13** | **56.07** |  **57.97** | **56.65** | **54.37** | **65.13** |     47.13 |
| **XL Code Search** | **RoBERTa**  |     48.28 |     47.66 |      46.11 |      46.4 |      47.6 |     43.76 |     40.15 |
|                    | **CodeBERT** | **48.71** | **48.33** |  **47.24** | **47.96** | **47.66** | **44.02** | **40.43** |
