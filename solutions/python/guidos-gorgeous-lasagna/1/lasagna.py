"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""

EXPECTED_BAKE_TIME = 40
EXPECTED_PREPATAION_TIME = 2


def bake_time_remaining(elapsed_bake_time: int) -> int:
    """Calculate remaining bake time in minutes

    :param elapsed_bake_time: int - actual minutes the lasagna has been in the oven
    :return: int - how many minutes the lasagna still needs to bake based on the `EXPECTED_BAKE_TIME` constant.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(number_of_layers: int) -> int:
    """Calculate preparation time in minutes

    :param number_of_layers: int -  number of layer you want to add to the lasagna
    :return: int - how many minutes you would spend making them
    """
    return number_of_layers * EXPECTED_PREPATAION_TIME


def elapsed_time_in_minutes(number_of_layers: int, elapsed_bake_time: int) -> int:
    """Calculate the elapsed cooking time.

    :param number_of_layers: int - the number of layers in the lasagna.
    :param elapsed_bake_time: int - elapsed cooking time.
    :return: int - total time elapsed (in minutes) preparing and cooking.

    This function takes two integers representing the number of lasagna layers and the
    time already spent baking and calculates the total elapsed minutes spent cooking the
    lasagna.
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
