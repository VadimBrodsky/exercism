from typing import List


def equilateral(sides: List[int]) -> bool:
    return valid_triangle(sides) and len(set(sides)) == 1


def isosceles(sides: List[int]) -> bool:
    return valid_triangle(sides) and len(set(sides)) < 3


def scalene(sides):
    return valid_triangle(sides) and len(set(sides)) == 3


def valid_triangle(sides: List[int]) -> bool:
    a, b, c = sides

    if not a or not b or not c:
        return False

    return a + b >= c and b + c >= a and a + c >= b
