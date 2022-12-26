FROM python:3.10-alpine
COPY . /tests
WORKDIR /tests
RUN python -m venv /tests/venv
RUN python -m pip install -r requirements.txt
RUN python -m pytest runner.py --alluredir=allure-results
RUN pwd
RUN ls
RUN cd /tests
RUN ls