# Chapter 3

## Exercise 3.1

> Which of the following are valid numerals? What are their values?
>
> ```.0e12 .e12 0.0e 0x12 0xABFG 0xA FFFF 0xFFFFFFFF 0x 0x1P10 0.1e1 0x0.1p1```

- `.0e12` - This is $0.0 * 10^{12} = 0$.
- `.e12` - This is not a valid numeral.
- `0.0e` - This is not a valid numeral.
- `0x12` - This is $18$ represented in hexadecimal.
- `0xABFG` - This is not a valid numeral.
- `0xA` - This is $10$ represented in hexadecimal.
- `FFFF` - This is not a valid numeral.
- `0xFFFFFFFF` - This is $4,294,967,295$ in hexadecimal.
- `0x` - This is not a valid numeral.
- `0x1P10` - This is $1 * 2^{10} = 1024.0$ since `P` represents a power of two.
- `0.1e1` - This is $0.1 * 10^{1} = 1.0$.
- `0x0.1p1` - This is $(1/16) * 2^{1} = 1/8$ since `0x0.1` is $1/16$ in hexadecimal and `p` (case-insensitive) represents a power of two.

## Exercise 3.2

> Explain the following results:
>
> ```
> math.maxinteger * 2               --> -2
> math.mininteger * 2               --> 0
> math.maxinteger * math.maxinteger --> 1
> math.mininteger * math.mininteger --> 0
> ```
>
> (Remember that integer arithmetic always wraps around.)

- Since `math.maxinteger` represents $2^{63} - 1$,
    - then `math.maxinteger * 2` is $(2^{63} - 1) * 2$.
    - Distributing the $2$ over $2^{63} - 1$, we get $2^{64} - 2$.
    - Normalizing the result to fit into 64 bits, we evaluate $(2^{64} - 2) \mathbin{\%} 2^{64}$.
    - Since $\mathbin{\%}$ is right-associative, we get $(2^{64} \mathbin{\%} 2^{64}) - (2 \mathbin{\%} 2^{64})$,
    - which evaluates to $0 - 2 = -2$.
- Since `math.mininteger * 2` represents $-2^{63}$,
    - then `math.mininteger * 2` is $(-2^{63} * 2) = -2^{64}$.
    - Normalizing the result to fit into 64 bits, we evaluate $-2^{64} \mathbin{\%} 2^{64}$.
    - Since $\mathbin{\%}$ is right-associative, we can get $(-1 + 1) \mathbin{\%} 2^{64}$,
    - which evaluates to $0 \mathbin{\%} 2^{64} = 0$.
- Since `math.maxinteger` represents $2^{63} - 1$,
    - then `math.maxinteger * math.maxinteger` is $(2^{63} - 1)^2$.
    - Since $(p + q)^2 = p^2 + 2pq + q^2$ (remember Algebra?), then
    - this is equivalent to $(2^{{63}^2} + 2*2^{63}*(-1) + (-1)^2)$,
    - which is equivalent to $2^{126} - 2^{64} + 1$.
    - Normalizing the result to fit into 64 bits, we evaluate $(2^{126} - 2^{64} + 1) \mathbin{\%} 2^{64}$.
    - Since $\mathbin{\%}$ is right-associative, we get $(2^{126} \mathbin{\%} 2^{64}) - (2^{64} \mathbin{\%} 2^{64}) + (1 \mathbin{\%} 2^{64})$,
    - which evaluates to $0 - 0 + 1 = 1$.
- Since `math.mininteger * 2` represents $-2^{63}$,
    - then `math.mininteger * math.mininteger` is $(-2^{63})^2 = -2^{126}$.
    - Normalizing the result to fit into 64 bits, we evaluate $-2^{126} \mathbin{\%} 2^{64}$,
    - which evaluates to $-0 = 0$.

## Exercise 3.3

> What will the following program print?
>
> ```lua
> for i = -10, 10 do
>   print(i, i % 3)
> end
> ```

```
-10     2
-9      0
-8      1
-7      2
-6      0
-5      1
-4      2
-3      0
-2      1
-1      2
0       0
1       1
2       2
3       0
4       1
5       2
6       0
7       1
8       2
9       0
10      1
```

## Exercise 3.4

> What is the result of the expression `2^3^4`? What about `2^-3^4`?

```lua
> 2^3^4
2.4178516392293e+24
> 2^-3^4
4.1359030627651e-25
```

## Exercise 3.5

> The number $12.7$ is equal to the fraction $127/10$, where the denominator is a power of ten. Can you express it as a common fraction where the denominator is a power of two? What about the number $5.5$?

- No, because there is no $n \in \mathbb{Z}$ that makes $12.7 * 2^n \in \mathbb{Z}$.
    - $12.7 * 2^n$
    - $= (12 + 0.7) * 2^n$
    - $= (12 * 2^n + 0.7 * 2^n)$.
    - $\forall n \in \mathbb{Z}. (12 * 2^n \in \mathbb{Z}) + (0.7 * 2^n \notin \mathbb{Z}) \implies 12.7 * 2^n \notin \mathbb{Z}$.
        - If $0.7 * 2^n \in \mathbb{Z}$, then there exists some $n \in \mathbb{Z}$ such that $10$ divides $7 * 2^n$.
        - But there does not exist such an $n$ because:
            - When $n < 0$, then $7 / 2^n \notin \mathbb{Z}$ because $2^n$ can never divide $7$ because $7$ is not a power of two.
            - When $n = 0$, then $7 * 2^0 = 7$ which is not divisible by 10. 
            - When $n > 0$, then
                - When $n \equiv 0 \bmod 4 \implies 2 \equiv 7 * 2^n \bmod 10$.
                - When $n \equiv 1 \bmod 4 \implies 4 \equiv 7 * 2^n \bmod 10$.
                - When $n \equiv 2 \bmod 4 \implies 8 \equiv 7 * 2^n \bmod 10$.
                - When $n \equiv 3 \bmod 4 \implies 6 \equiv 7 * 2^n \bmod 10$.
                - No congruence relation exists that implies $0 \equiv 7 * 2^n \bmod 10$.
- Yes, $5.5 = 11/2^1$.

## Exercise 3.6

> Write a function to compute the volume of a right circular cone, given its height and the angle between a generatrix and the axis.

The formula for the volume of a right circular cone is $V = \pi r^2 \frac{h}{3}$. We are given $h$ and the angle $\theta$ between a generatrix and the axis as inputs. Using the right triangle relationship $\tan\theta = \frac{\text{r}}{\text{h}}$, we can derive $r = h * \tan\theta$. Substituting $r$, we get $V = \pi (h * \tan\theta)^2 \frac{h}{3}$. Combining like-terms, we get $V = \frac{\pi h^3}{3} \tan^2\theta$. See `cone_volume.lua` for the implementation.

## Exercise 3.7

> Using `math.random`, write a function to produce a psuedo-random number with a standard normal (Gaussian) distribution.

See `normal_generator.lua`.

![central limit theorem](./lol.png)
