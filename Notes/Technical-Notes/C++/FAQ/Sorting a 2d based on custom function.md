# Sorting a 2d based on custom function


```cpp
#include <iostream>
#include <vector>
#include <algorithm>

// Comparator function
bool comparator(const std::vector<int>& a, const std::vector<int>& b) {
    return a[1] < b[1]; // ascending order 
}

int main() {
    // Assuming a 10x2 2D vector
    std::vector<std::vector<int>> data = {
        {5, 2}, {3, 4}, {6, 1}, {8, 0}, {1, 7}
    };
    
    // Sorting with the custom comparator function
    std::sort(data.begin(), data.end(), comparator);
    
    // Printing the sorted data
    for (const auto& row : data) {
        std::cout << row[0] << ", " << row[1] << std::endl;
    }
    
    return 0;
}
```