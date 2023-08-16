from scripts.calculator import add, substract, multiply, division
from pytest import mark


@mark.parametrize("x, y, expected_result", [
    (20, 10, 30),
    (40, 10, 50),
    (70, 20, 90),
    (60, 40, 100),
])
def test_add_function(x, y, expected_result):
    assert add(x, y) == expected_result

@mark.parametrize("x, y, expected_result", [
    (20, 10, 10),
    (40, 10, 30),
    (70, 20, 50),
    (60, 40, 20),
])
def test_substract_function(x, y, expected_result):
    assert substract(x, y) == expected_result

#def test_substract_function():
#    assert substract(20, 10) == 10
@mark.parametrize("x, y, expected_result", [
    (20, 10, 200),
    (40, 10, 400),
    (70, 20, 1400),
    (60, 40, 2400),
])
def test_multiply_function(x, y, expected_result):
    assert multiply(x, y) == expected_result

@mark.parametrize("x, y, expected_result", [
    (20, 10, 2),
    (40, 10, 4),
    (70, 20, 3.5),
    (60, 40, 1.5),
])
def test_division_function(x, y, expected_result):
    assert division(x, y) == expected_result