## Time Complexity of `pop()` and why dequeue is important 

- Popping the last element `pop() or pop(-1)` from a list takes **constant time**, O(1) as it does not **require shifting elements**
- Popping the first element `pop(0)` from a list takes **linear time**, O(n), because all the subsequent elements need to be shifted forward by one position
- Popping an element from an arbitrary position `i` in the list also takes **linear time**, O(n−i), because all the elements after `i` need to be shifted