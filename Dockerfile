FROM ubuntu:xenial

RUN apt-get update --fix-missing && apt dist-upgrade

# Install virtualenv, nginx, supervisor
RUN apt-get install -y build-essential git
RUN apt-get install -y python python-dev python-setuptools
RUN apt-get install -y python-pip python-virtualenv
RUN apt-get install -y nginx supervisor

RUN service supervisor stop
# TODO: check before
RUN pip install supervisor-stdout

# create virtual env and install dependencies
# Due to a bug with h5 we install Cython first
RUN virtualenv /opt/venv
ADD ./requirements.txt /opt/venv/requirements.txt
RUN source /opt/venv/bin/activate/ && pip install Cython && pip install -r /opt/venv/requirements.txt

# expose port
EXPOSE 80

# Add our config files
ADD ./supervisord.conf /etc/supervisord.conf
ADD ./nginx.conf /etc/nginx/nginx.conf

# Copy our service code
ADD ./service /opt/app

# restart nginx to load the config
RUN service nginx stop

# start supervisor to run our wsgi server
CMD supervisord -c /etc/supervisord.conf -n

