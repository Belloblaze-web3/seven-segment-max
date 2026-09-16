# Seven Segment Maximum

## Problem

A decimal number is displayed using matchsticks in a seven-segment display. Each digit requires a known number of matchsticks. Given a number `N`, determine the numerically largest number that can be formed using at most the same number of matchsticks used to display `N`.

The matchstick costs are:

| Digit | Matchsticks |
|---|---:|
| `0` | 6 |
| `1` | 2 |
| `2` | 5 |
| `3` | 5 |
| `4` | 4 |
| `5` | 5 |
| `6` | 6 |
| `7` | 3 |
| `8` | 7 |
| `9` | 6 |

## Key Observation

The digit `1` gives the greatest number of digits per matchstick because it requires only two matchsticks. Therefore, after determining the total number of available matchsticks:

- If the total is even, use only `1`s.
- If the total is odd, use one `7` (three matchsticks) followed by as many `1`s as possible.

Using `7` for an odd remainder avoids wasting a matchstick and produces the largest number with the maximum possible length. For numbers of equal length, the leading `7` is also larger than `1`.

## Algorithm

1. Read each input number.
2. Add the matchstick cost of every digit.
3. If the total is even, print `total / 2` copies of `1`.
4. If the total is odd, print `7` followed by `(total - 3) / 2` copies of `1`.

## Correctness

Every digit requires at least two matchsticks, and digit `1` achieves this minimum. Hence, a solution with the greatest number of digits must use as many `1`s as possible. An even total can be fully partitioned into pairs of matchsticks, producing only `1`s. For an odd total, one group of three matchsticks is necessary; choosing digit `7` is optimal because it is the largest valid digit with three matchsticks. The remaining even number of matchsticks is optimally converted into `1`s. Therefore, the constructed number is numerically maximal.

## Complexity

Let `L` be the number of digits in the input number and `M` be the total number of matchsticks.

| Measure | Complexity |
|---|---:|
| Time | `O(L + M)` |
| Extra space | `O(M)` for the output |

The output itself can contain `O(M)` digits.

## Implementation

The solution is implemented in GNU Bash 5.0.17 in [`solution.sh`](solution.sh).

## Example

The input number `1` uses two matchsticks, so the largest possible number is `1`. The input number `0` uses six matchsticks, which can form three copies of `1`, giving `111`.
