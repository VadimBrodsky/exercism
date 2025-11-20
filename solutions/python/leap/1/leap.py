def leap_year(year):
    return is_divisible(year, 4) and (
        not is_divisible(year, 100) or is_divisible(year, 400)
    )


def is_divisible(dividend: int, divisor: int) -> int:
    return dividend % divisor == 0
