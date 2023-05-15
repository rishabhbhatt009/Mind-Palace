# Data Structures and Algorithm 


## Strategy : 

### Breadth First Strategy 
Cover something in all topics 
- [Top Interview Questions Easy](https://leetcode.com/explore/interview/card/top-interview-questions-easy/)
- [Top Interview Questions Medium](https://leetcode.com/explore/interview/card/top-interview-questions-medium/)
- [Top Interview Questions Hard](https://leetcode.com/explore/interview/card/top-interview-questions-hard/)

- Graph
- Dynamic Programming

<hr>

## Algorithms :
- Slow and Fast pointer 
- Hashmaps 

<hr> 

## Question to remember 
- **Rotating a image 90 degree** = Transpose + Reverse each row

<hr>

## Clear Leet Code Explore Cards 

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

