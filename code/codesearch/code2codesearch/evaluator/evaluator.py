# Copyright (c) Microsoft Corporation. 
# Licensed under the MIT license.
import logging
import sys,json
import numpy as np

def read_answers(filename):
    answers={}
    with open(filename) as f:
        for line in f:
            line=line.strip()
            js=json.loads(line)
            answers[js['url']]=js['idx']
    return answers

def read_predictions(filename):
    predictions={}
    with open(filename) as f:
        for line in f:
            line=line.strip()
            js=json.loads(line)
            predictions[js['url']]=js['answers']
    return predictions

def calculate_scores(answers,predictions):
    scores=[]
    for key in answers:
        if key not in predictions:
            logging.error("Missing prediction for url {}.".format(key))
            sys.exit()
        query_scores = []
        flag = False
        for rank,idx in enumerate(predictions[key]):
            prediction_prefix = idx.split("/")[0]
            if prediction_prefix==answers[key].split("/")[0]:
                query_scores.append(1/(rank+1))
                flag = True
        if flag is False:
            scores.append(0)
        else:
            scores.append(round(np.mean(query_scores),4))
    result={}
    result['MRR']=round(np.mean(scores),4)
    return result

def precison_atk(answers, predictions, k=6):
    scores = []
    
    for key in answers:
        if key not in predictions:
            logging.error("Missing prediction for url {}.".format(key))
            sys.exit()
        precision_count = 0
        iterator_count = 0
        flag = False
        for rank, idx in enumerate(predictions[key]):
            prediction_prefix = idx.split("/")[0]
            if prediction_prefix==answers[key].split("/")[0]:
                precision_count += 1
                flag = True
            iterator_count += 1
            if iterator_count == k:
                break
        if flag is False:
            scores.append(0)
        else:
            scores.append(round(precision_count/k, 4))
        
    result={}
    result['Precision@'+str(k)]=round(np.mean(scores),4)
    return result


def main():
    import argparse
    parser = argparse.ArgumentParser(description='Evaluate leaderboard predictions for NL-code-search-Adv dataset.')
    parser.add_argument('--answers', '-a',help="filename of the labels, in txt format.")
    parser.add_argument('--predictions', '-p',help="filename of the leaderboard predictions, in txt format.")
    

    args = parser.parse_args()
    answers=read_answers(args.answers)
    predictions=read_predictions(args.predictions)
    scores=calculate_scores(answers,predictions)
    precision = precison_atk(answers,predictions)
    print(scores)
    print(precision)

if __name__ == '__main__':
    main()
