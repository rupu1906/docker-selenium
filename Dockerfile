FROM python:3.10

WORKDIR /TESTING/
RUN python -m pip install --upgrade pip


COPY requirements.txt requirements.txt
COPY . .
RUN pip3 install -r requirements.txt
