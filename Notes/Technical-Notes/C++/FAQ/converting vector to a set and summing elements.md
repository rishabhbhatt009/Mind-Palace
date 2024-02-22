C++ code to : 
1. convert a vector to a set + sort vector
2. sum the set and vector 
3. print vec and both sum

---

```cpp
#include <iostream>
#include <vector>
#include <set>
#include <numeric>  // For std::accumulate
#include <algorithm> // For std::for_each

int main() {
    // Example vector
    std::vector<int> vec = {1, 2, 3, 4, 5, 5, 6};

    // Convert vector to set
    std::set<int> set(vec.begin(), vec.end());

	// Sort the vector in descending order 
	std::sort(vec.begin(), vec.end(), std::greater<int>());
    
    // Sum the vector
    int sumVec = std::accumulate(vec.begin(), vec.end(), 0);

    // Sum the set
    int sumSet = std::accumulate(set.begin(), set.end(), 0);

    // Print the vectors 
    auto print = [](int x) {cout << x << " ";};
    for_each(nums.begin(), nums.end(), print);
    cout << endl;
    
    // Print the sums
    std::cout << "Sum of vector elements: " << sumVec << std::endl;
    std::cout << "Sum of set elements: " << sumSet << std::endl;

    return 0;
}
```

---