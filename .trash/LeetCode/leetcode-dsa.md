# Data Structures and Algorithm 

## Table of Contents
1. [Strategy](#strategy)
2. [Algorithms](#algorithms)
3. [Leetcode questions to remember](#leetcode-questions-to-remember)
4. [FAQ](#faq) 


<hr>

## Strategy : 

### 1. Breadth First Strategy 
Cover something from all topics before diving deep into some topics 
- [Top Interview Questions Easy](https://leetcode.com/explore/interview/card/top-interview-questions-easy/)
- [Top Interview Questions Medium](https://leetcode.com/explore/interview/card/top-interview-questions-medium/)
- [Top Interview Questions Hard](https://leetcode.com/explore/interview/card/top-interview-questions-hard/)

### 2. Using plain txt editor 
Use plain text editor like **google docs** to write code before you executing/running on the leetcode console

### 3. Give 30-45 Mins per problem 
Don't spend 3-4 hours on a **single question**. If you are not able to solve questions within 30-45 minutes you probably wont be able to solve the question. **Look at the solution and understand why it works**.

<hr>

## Algorithms :
- Slow and Fast pointer 
- Hashmaps 
- [Dynamic Programming](./dynamic-programming.md) 

<hr>

## Leetcode things to remember
- **Rotating a image 90 degree** = Transpose + Reverse each column
- **Incrementing in while loop** : always remember to update control variables in while loop
- **Copy of a list** : `lst2 = lst1` creates a pointer to the same lst, does not create a copy. [Python](../Python/Python.md/#creating-a-copy-of-list-shallow-vs-deepcopy-link) 
- [Questions = Min Stack](https://leetcode.com/problems/min-stack/description/) : How to get min of a stack in O(1) without using heap 

<hr>

## FAQ

### Clear Leet Code Explore Cards 
Go into the corresponding Explore Card, inspect and paste the below code in the console and click "Enter".

```js
function clearExploreCards(){
    var titleCards = $(".list-group-item.chapter-item > .chapter-base");
    for(i = 0; i < titleCards.length; i++){
        if($(titleCards[i]).hasClass("false")){
            $($(titleCards[i]).find(".expand-list-btn")).trigger("click");
        }
    }
    var checkBoxes = $(".check-mark.completed");
    for(j = 0; j < checkBoxes.length; j++){
        $(checkBoxes[j]).trigger("click");
        $(".swal2-buttonswrapper > button").trigger("click");
    }
}
clearExploreCards();
```

