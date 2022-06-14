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
# train java-description program summarization on GPU 0 with CodeBERT
bash run_translation.sh 0 java desc program codebert train
# train description-java program synthesis on GPU 2 with PLBART
bash run_translation.sh 2 desc python program plbart eval
# train python-comment snippet summarization on GPU 2 with CodeT5
bash run_translation.sh 2 java comment snippet codet5 eval
# train comment-python snippet synthesis on GPU 2 with CodeT5
bash run_translation.sh 2 comment python snippet codet5 train

```

