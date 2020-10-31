FROM python:3.7
ENV PYTHONUNBUFFERED 1
LABEL key="test01"

RUN mkdir /app
ADD . /app/


RUN pip install --upgrade pip  
RUN pip install pipenv


WORKDIR /app
RUN pipenv install


WORKDIR /app/msg
RUN pipenv run python manage.py makemigrations app
RUN pipenv run python manage.py migrate
CMD [ "pipenv", "run", "python", "manage.py", "runserver", "0.0.0.0:8000" ]


EXPOSE 8000
