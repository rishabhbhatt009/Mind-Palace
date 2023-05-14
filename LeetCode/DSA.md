# Data Structures and Algorithm 

- Arrays and Hashing
  - 
- Linked List
  - 
- Stacks and Queues
  - 
- Binary Search 
  - 



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

