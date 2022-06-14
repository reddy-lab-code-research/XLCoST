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
