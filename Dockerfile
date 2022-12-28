FROM python:3.10-alpine
COPY . /tests
WORKDIR /tests

RUN apk --no-cache add openjdk11 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN python -m venv /tests/venv
RUN python -m pip install -r requirements.txt

RUN wget https://github.com/allure-framework/allure2/releases/download/2.20.1/allure-2.20.1.zip && unzip allure-2.20.1.zip

RUN apt-get -y install openjdk-11-jdk

ARG BUILD_VAR_COMMAND_STRING="default_value"
ENV COMMAND_STRING=$BUILD_VAR_COMMAND_STRING
RUN $COMMAND_STRING
RUN ls allure-results
RUN  ./allure-2.20.1/bin/allure generate allure-results allure-report
#python -m pytest runner.py --alluredir=allure-results

