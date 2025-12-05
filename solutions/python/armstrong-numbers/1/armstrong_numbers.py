def is_armstrong_number(number: int) -> int:
    digits = [int(d) for d in str(number)]

    sum = 0
    for digit in list(digits):
        sum += digit ** len(digits)

    return sum == number
