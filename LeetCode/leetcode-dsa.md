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



<hr>

## Algorithms :

- Slow and Fast pointer 
- Hashmaps 

<hr>

## Leetcode questions to remember
- **Rotating a image 90 degree** = Transpose + Reverse each column

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

