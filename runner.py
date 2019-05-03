import pytest
import allure


def test1_fail():
    with pytest.allure.step('FAILED'):
        assert False


def test2_fail():
    with pytest.allure.step('PASSED'):
        assert True
