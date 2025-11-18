# 1, 1, 2, 3, 5, 8, 13
def square(number: int) -> int:
    if not 1 <= number <= 64:
        raise ValueError("square must be between 1 and 64")

    return 2 ** (number - 1)


def total() -> int:
    total = 0

    for current_square in range(1, 65):
        total += square(current_square)

    return total
