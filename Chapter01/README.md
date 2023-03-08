# Chapter 1

## Exercise 1.1

> Run the factorial example. What happens to your program if you enter a negative number? Modify the example to avoid this problem.

If you enter a number, the function will infinitely recurse and cause a stack overflow. A factorial is only defined for non-negative integers, so a separate base case condition to return `nil` to account for negative integer inputs.

## Exercise 1.2

> Run the twice example, both by loading the file with the -i option and with dofile. Which way do you prefer?

- If I am not currently in the interactive shell, then `-i`.

- But if I am already in the interactive shell, then `dofile`.

## Exercise 1.3

> Can you name other languages that use "--" for comments?

Two languages that come to mind are SQL and Haskell.

## Exercise 1.4

> Which of the following strings are valid identifiers?
>
> ```___ _end End end until? nil NULL one-step```

If "valid identifiers" is referring to valid variable names:

- `___` is `[OK]`.
- `_end` is `[OK]`.
- `End` is `[OK]`.
- `end` is not `[OK]`. Reserved word, but valid identifier.
- `until?` is not `[OK]`. `?` not in valid charset.
- `nil` is not `[OK]`. It is a data type literal, but valid identifier.
- `NULL` is `[OK]`.
- `one-step` is not `[OK]`. `-` not in valid charset.

## Exercise 1.5

> What is the value of the expression type(nil) == nil? (You can use Lua to check your answer.) Can you explain this result?

`false`. `type(nil)` yields the string value `'nil'` which is different from `nil`.

## Exercise 1.6

> How can you check whether a value is a Boolean without using the function `type`?

You can check if the value is equal to the Boolean literals:

```lua
function is_boolean(value)
   return value == true or value == false
end
```

## Example 1.7

> Consider the following expression:
> 
> ```lua
> (x and y and (not z)) or ((not y) and x)
> ```
>
> Are the parentheses necessary? Would you recommend their use in that expression?

Parentheses are not necessary in this expression because `not` has higher operator precedence than `and`, and `and` has higher precedence than `or`. I would recommend using parentheses. At least for me, I always have to look up operator precendence order, so making the order explicit is more readable.

## Example 1.8

> Write a simple script that prints its own name without knowing it in advance.

See `iknowmyname.lua`.
