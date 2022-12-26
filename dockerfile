FROM python:3.10
ADD . /tests
WORKDIR /tests
RUN git clone https://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@github.com/andriibuimistr/allure_test.git
RUN python -m venv /tests/venv
RUN python -m pip install -r requirements.txt
RUN python -m pytest runner.py --alluredir=allure-results
