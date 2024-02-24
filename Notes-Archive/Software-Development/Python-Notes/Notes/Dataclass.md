## `@dataclass`

- Use full for data heavy classes as it provides implementation for for `__init__` , `__repr__`, 
- Reduces the **amount of code** you have to re-write every time you add an attribute
- **Default Value** : We have the ability to set default values for attributes using `field`
- this is useful for mutable types like `list`. Setting `[]` as default values will result in all instances pointing to the same list upon initialization
- using a decorator `@dataclass()`
  - Parameters :
    - `frozen` : attributes can not be changed once declared 
    - `kw_only` : arguments have to be supplied with keywords on init
- You can also set parameters like 
  - `init` : include attribute in `init`
  - `repr` : include attribute in object `repr` 
- You can define functions : 
  - `def __postinit__(self)` : runs after initialization for attributed that depend on other attributes

- Resource : https://www.youtube.com/watch?v=CvQ7e6yUtnw&ab_channel=ArjanCodes

---