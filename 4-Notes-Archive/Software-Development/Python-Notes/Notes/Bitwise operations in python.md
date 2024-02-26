# Bitwise operations in Python 

---

- used for manipulating individual bits of data 
- important in low-level programming and can also be used in **algorithm optimization**
- used in tasks such as data compression, cryptography, and network programming. They operate at the bit level, which makes them very fast and efficient for certain types of calculations.

---

1. **AND** (`&`): This operator sets each bit to 1 if both bits are 1.
2. **OR** (`|`): Sets each bit to 1 if one of the two bits is 1.
3. **XOR** (`^`): Sets each bit to 1 if only one of the two bits is 1.
4. **NOT** (`~`): Inverts all the bits.
5. **Left Shift** (`<<`): Shifts the bits of a number to the left by a specified number of positions. Each shift to the left doubles the number.
6. **Right Shift** (`>>`): Shifts the bits of a number to the right by a specified number of positions. Each shift to the right halves the number.

```python
a = 12  # 1100 in binary
b = 5   # 0101 in binary

### operations 
a & b  	# 0100 in binary, which is 4 in decimal
a | b 	# 1101 in binary, which is 13 in decimal
a ^ b  	# 1001 in binary, which is 9 in decimal
~a  	# Inverts all bits of a
a << 2  # Shifts the bits of a two places to the left
a >> 2  # Shifts the bits of a two places to the right
```

---

- set ith bit in the number : `number = number | 1<<i`
- check ith bit in the number : `number & (2**i)` or `number & 1<<i`

---