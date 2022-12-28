FROM python:3.10-alpine
COPY . /tests
WORKDIR /tests

RUN  apk update \
  && apk upgrade \
  && apk add ca-certificates \
  && update-ca-certificates \
  && apk add --update coreutils && rm -rf /var/cache/apk/*   \
  && apk add --update openjdk11 tzdata curl unzip bash \
  && apk add --no-cache nss \
  && rm -rf /var/cache/apk/

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

