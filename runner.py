import pytest
import allure
import requests


def test1_fail():
    r = requests.request("Get", "http://127.0.0.1:5000/")
    allure.attach("name", r.text)
    with pytest.allure.step('FAILED'):
        assert True


def test2_fail():
    with pytest.allure.step('PASSED'):
        assert True
