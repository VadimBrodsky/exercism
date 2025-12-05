def is_armstrong_number(number: int) -> int:
    digits = [int(d) for d in str(number)]
    e = len(digits)

    return sum(digit**e for digit in digits) == number
