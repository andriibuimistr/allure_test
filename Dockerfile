FROM python:3.10-alpine
COPY . /tests
WORKDIR /tests
RUN python -m venv /tests/venv
RUN python -m pip install -r requirements.txt

ARG BUILD_VAR_COMMAND_STRING="default_value"
ENV COMMAND_STRING=$BUILD_VAR_COMMAND_STRING
RUN python -m pytest $COMMAND_STRING --alluredir allure-results
RUN ls allure-results

#python -m pytest runner.py --alluredir=allure-results

