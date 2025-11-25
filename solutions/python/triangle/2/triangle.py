def equilateral(sides: list[int]) -> bool:
    return valid_triangle(sides) and len(set(sides)) == 1


def isosceles(sides: list[int]) -> bool:
    return valid_triangle(sides) and len(set(sides)) < 3


def scalene(sides: list[int]):
    return valid_triangle(sides) and len(set(sides)) == 3


def valid_triangle(sides: list[int]) -> bool:
    a, b, c = sides

    if not a or not b or not c:
        return False

    return a + b >= c and b + c >= a and a + c >= b
