## Code Summarization



The file tree below shows the first level directory structures for folders containing Snippet Summarization(`pair_data_tok_1_comment`) and Program Summarization(`pair_data_tok_full_desc`) data respectively. For snippet summarization code snippets are paired with their corresponding comments. For program summarization, full program codes are paired with their corresponding descriptions and comments concatenated.

```
pair_data_tok_1_comment (Snippet Summarization)
├── C#-comment
├── C++-comment
├── C-comment
├── Java-comment
├── Javascript-comment
├── PHP-comment
└── Python-comment

pair_data_tok_full_desc_comment (Program Summarization)
├── C#-desc
├── C++-desc
├── C-desc
├── Java-desc
├── Javascript-desc
├── PHP-desc
└── Python-desc
```

Each pair directory contains the ```train``` ```test``` and ```val``` splits of the code data and the corresponding comment or `comment-description` concatenated. The ```map.jsonl``` files contain a line by line mapping of the ```problem_id``` to the lines in the corresponding code files and comment/description files. 

```
pair_data_tok_full_desc_comment
└── Python-desc
    ├── test-Python-desc-tok.py
    ├── test-Python-desc-tok.txt
    ├── test-Python-map.jsonl
    ├── test-desc-map.jsonl
    ├── train-Python-desc-tok.py
    ├── train-Python-desc-tok.txt
    ├── train-Python-map.jsonl
    ├── train-desc-map.jsonl
    ├── val-Python-desc-tok.py
    ├── val-Python-desc-tok.txt
    ├── val-Python-map.jsonl
    └── val-desc-map.jsonl
```

### Data Samples

`train-Python-desc-tok.py` file:

```py
def maxPresum ( a , b ) : NEW_LINE INDENT X = max ( a [ 0 ] , 0 ) NEW_LINE for i in range ( 1 , len ( a ) ) : NEW_LINE INDENT a [ i ] += a [ i - 1 ] NEW_LINE X = max ( X , a [ i ] ) NEW_LINE DEDENT Y = max ( b [ 0 ] , 0 ) NEW_LINE for i in range ( 1 , len ( b ) ) : NEW_LINE INDENT b [ i ] += b [ i - 1 ] NEW_LINE Y = max ( Y , b [ i ] ) NEW_LINE DEDENT return X + Y NEW_LINE DEDENT A = [ 2 , - 1 , 4 , - 5 ] NEW_LINE B = [ 4 , - 3 , 12 , 4 , - 3 ] NEW_LINE print ( maxPresum ( A , B ) ) NEW_LINE
import math NEW_LINE def sumOfTwoCubes ( n ) : NEW_LINE INDENT lo = 1 NEW_LINE hi = round ( math . pow ( n , 1 / 3 ) ) NEW_LINE while ( lo <= hi ) : NEW_LINE INDENT curr = ( lo * lo * lo + hi * hi * hi ) NEW_LINE if ( curr == n ) : NEW_LINE INDENT return True NEW_LINE DEDENT if ( curr < n ) : NEW_LINE INDENT lo += 1 NEW_LINE DEDENT else : NEW_LINE INDENT hi -= 1 NEW_LINE DEDENT DEDENT return False NEW_LINE DEDENT N = 28 NEW_LINE if ( sumOfTwoCubes ( N ) ) : NEW_LINE INDENT print ( " True " ) NEW_LINE DEDENT else : NEW_LINE INDENT print ( " False " ) NEW_LINE DEDENT
sieve = [ 1 ] * ( 1000000 + 1 ) NEW_LINE def sieveOfPrimes ( ) : NEW_LINE INDENT global sieve NEW_LINE N = 1000000 NEW_LINE for i in range ( 2 , N + 1 ) : NEW_LINE INDENT if i * i > N : NEW_LINE INDENT break NEW_LINE DEDENT if ( sieve [ i ] == 0 ) : NEW_LINE INDENT continue NEW_LINE DEDENT for j in range ( i * i , N + 1 , i ) : NEW_LINE INDENT sieve [ j ] = 0 NEW_LINE DEDENT DEDENT DEDENT def getArray ( arr , N ) : NEW_LINE INDENT global sieve NEW_LINE A = [ 0 ] * N NEW_LINE v = [ ] NEW_LINE sieveOfPrimes ( ) NEW_LINE for i in range ( 2 , int ( 1e5 ) + 1 ) : NEW_LINE INDENT if ( sieve [ i ] ) : NEW_LINE INDENT v . append ( i ) NEW_LINE DEDENT DEDENT j = 0 NEW_LINE for i in range ( N ) : NEW_LINE INDENT ind = arr [ i ] NEW_LINE if ( A [ i ] != 0 ) : NEW_LINE INDENT continue NEW_LINE DEDENT elif ( A [ ind ] != 0 ) : NEW_LINE INDENT A [ i ] = A [ ind ] NEW_LINE DEDENT else : NEW_LINE INDENT prime = v [ j ] NEW_LINE A [ i ] = prime NEW_LINE A [ ind ] = A [ i ] NEW_LINE j += 1 NEW_LINE DEDENT DEDENT for i in range ( N ) : NEW_LINE INDENT print ( A [ i ] , end = " ▁ " ) NEW_LINE DEDENT DEDENT if __name__ == ' _ _ main _ _ ' : NEW_LINE INDENT arr = [ 4 , 1 , 2 , 3 , 4 ] NEW_LINE N = len ( arr ) NEW_LINE getArray ( arr , N ) NEW_LINE DEDENT
def findNthNumber ( N ) : NEW_LINE INDENT result = 0 NEW_LINE p = 1 NEW_LINE while ( N > 0 ) : NEW_LINE INDENT result += ( p * ( N % 9 ) ) NEW_LINE N = N // 9 NEW_LINE p = p * 10 NEW_LINE DEDENT return result NEW_LINE DEDENT if __name__ == ' _ _ main _ _ ' : NEW_LINE INDENT N = 9 NEW_LINE print ( findNthNumber ( N ) ) NEW_LINE DEDENT
import math NEW_LINE def check ( A , B ) : NEW_LINE INDENT if ( A == B ) : NEW_LINE INDENT return 1 NEW_LINE DEDENT dig1 = math . floor ( math . log10 ( A ) + 1 ) NEW_LINE dig2 = math . floor ( math . log10 ( B ) + 1 ) NEW_LINE if ( dig1 != dig2 ) : NEW_LINE INDENT return 0 NEW_LINE DEDENT temp = A NEW_LINE while ( True ) : NEW_LINE INDENT power = pow ( 10 , dig1 - 1 ) NEW_LINE firstdigit = A // power NEW_LINE A = A - firstdigit * power NEW_LINE A = A * 10 + firstdigit NEW_LINE if ( A == B ) : NEW_LINE INDENT return 1 NEW_LINE DEDENT if ( A == temp ) : NEW_LINE INDENT return 0 NEW_LINE DEDENT DEDENT DEDENT A , B = 967 , 679 NEW_LINE if ( check ( A , B ) ) : NEW_LINE INDENT print ( " Yes " ) NEW_LINE DEDENT else : NEW_LINE INDENT print ( " No " ) NEW_LINE DEDENT
```

`train-Python-map.jsonl` file:

```c
10005
10010
10018
10023
10033
```

`train-Python-desc-tok.txt` file:
```
Maximum Prefix Sum possible by merging two given arrays | Python3 implementation of the above approach ; Stores the maximum prefix sum of the array A [ ] ; Traverse the array A [ ] ; Stores the maximum prefix sum of the array B [ ] ; Traverse the array B [ ] ; Driver code
Check if a number can be represented as sum of two positive perfect cubes | Python3 program for the above approach ; Function to check if N can be represented as sum of two perfect cubes or not ; If it is same return true ; ; If the curr smaller than n increment the lo ; If the curr is greater than curr decrement the hi ; Driver Code ; Function call to check if N can be represented as sum of two perfect cubes or not
Generate an N | Python3 program for the above approach ; Function to generate all prime numbers upto 10 ^ 6 ; Initialize sieve [ ] as 1 ; Iterate over the range [ 2 , N ] ; If current element is non - prime ; Make all multiples of i as 0 ; Function to construct an array A [ ] satisfying the given conditions ; Stores the resultant array ; Stores all prime numbers ; Sieve of Erastosthenes ; Append the integer i if it is a prime ; Indicates current position in list of prime numbers ; Traverse the array arr [ ] ; If already filled with another prime number ; If A [ i ] is not filled but A [ ind ] is filled ; Store A [ i ] = A [ ind ] ; If none of them were filled ; To make sure A [ i ] does not affect other values , store next prime number ; Print the resultant array ; Driver Code ; Function Call
Nth natural number after removing all numbers consisting of the digit 9 | Function to find Nth number in base 9 ; Stores the Nth number ; Iterate while N is greater than 0 ; Update result ; Divide N by 9 ; Multiply p by 10 ; Return result ; Driver Code
Check if an integer is rotation of another given integer | Python3 implementation of the approach ; Function to check if the integer A is a rotation of the integer B ; Stores the count of digits in A ; Stores the count of digits in B ; If dig1 not equal to dig2 ; Stores position of first digit ; Stores the first digit ; Rotate the digits of the integer ; If A is equal to B ; If A is equal to the initial value of integer A ; Driver code
```

`train-desc-map.jsonl` file:

```c
10005
10010
10018
10023
10033
```

