FROM python:3.10
COPY . /tests
WORKDIR /tests
RUN python -m venv /tests/venv
RUN python -m pip install -r requirements.txt
RUN python -m pytest runner.py --alluredir=allure-results
