# 1, 1, 2, 3, 5, 8, 13
def square(number: int) -> int:
    if not 1 <= number <= 64:
        raise ValueError("square must be between 1 and 64")

    current_square = 0
    next_square = 1

    for _ in range(1, number):
        current_square = next_square
        next_square += current_square

    return next_square


def total() -> int:
    total = 0

    for current_square in range(1, 65):
        total += square(current_square)

    return total
