import pytest
import allure
import requests


def test1_fail():
    r = requests.request("Get", "https://www.italki.com/")
    allure.attach("name", r.status_code)
    with pytest.allure.step('Check code'):
        assert r.status_code == 200


def test2_fail():
    with pytest.allure.step('PASSED'):
        assert True
