## Code Summarization



The file tree below shows the first level directory structures for folders containing Snippet Summarization(`pair_data_tok_1_comment`) and Program Summarization(`pair_data_tok_full_desc`) data respectively. For snippet summarization code snippets are paired with their corresponding comments. For program summarization, full program codes are paired with their corresponding descriptions.

```
pair_data_tok_1_comment (Snippet Summarization)
├── C#-comment
├── C++-comment
├── C-comment
├── Java-comment
├── Javascript-comment
├── PHP-comment
└── Python-comment

pair_data_tok_full_desc (Program Summarization)
├── C#-desc
├── C++-desc
├── C-desc
├── Java-desc
├── Javascript-desc
├── PHP-desc
└── Python-desc
```

Each pair directory contains the ```train``` ```test``` and ```val``` splits of the code data and the corresponding comment or description. The ```map.jsonl``` files contain a line by line mapping of the ```problem_id``` to the lines in the corresponding code files and comment/description files. These relationships and file structures remain exactly the same for ```pair_data_tok_full_desc``` (program level) synthesis, the only difference being that instead of code snippets, they contain full programs and problem descriptions.

```
pair_data_tok_1_comment
├── C#-comment
    ├── test-C#-comment-tok.cs
    ├── test-C#-comment-tok.txt
    ├── test-C#-map.jsonl
    ├── test-comment-map.jsonl
    ├── train-C#-comment-tok.cs
    ├── train-C#-comment-tok.txt
    ├── train-C#-map.jsonl
    ├── train-comment-map.jsonl
    ├── val-C#-comment-tok.cs
    ├── val-C#-comment-tok.txt
    ├── val-C#-map.jsonl
```

### Data Samples

`train-C#-comment-tok.cs` file:

```cs
using System ; using System . Collections . Generic ; class GFG { static int maxPresum ( List < int > a , List < int > b ) {
int X = Math . Max ( a [ 0 ] , 0 ) ;
for ( int i = 1 ; i < a . Count ; i ++ ) { a [ i ] += a [ i - 1 ] ; X = Math . Max ( X , a [ i ] ) ; }
int Y = Math . Max ( b [ 0 ] , 0 ) ;
for ( int i = 1 ; i < b . Count ; i ++ ) { b [ i ] += b [ i - 1 ] ; Y = Math . Max ( Y , b [ i ] ) ; } return X + Y ; }
```

`train-C#-map.jsonl` file:

```c
10005-C#-1
10005-C#-2
10005-C#-3
10005-C#-4
10005-C#-5
```

`train-C#-comment-tok.txt` file:
```
C # Program to implement the above approach
Stores the maximum prefix sum of the array A [ ]
Traverse the array A [ ]
Stores the maximum prefix sum of the array B [ ]
Traverse the array B [ ]
```

`train-comment-map.jsonl` file:

```c
10005-C#-1
10005-C#-2
10005-C#-3
10005-C#-4
10005-C#-5
```

