##############################################################
# to build:
#    docker build -f Dockerfile -t coursera .
# to run:
#    docker run -it -p 8888:8888 -v /home/ishivvers/Documents/2020/coursera/ml-coursera-python-assignments/:/workdir/ coursera:latest bash
# from inside container:
#    jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
##############################################################
FROM ubuntu:18.04

############################################
# system installs:
RUN apt-get update \
    && apt-get install -y python3 \
                          python3-pip


############################################
# make python3 the default
RUN ln -sf /usr/bin/python3 /usr/local/bin/python \
 && ln -sf /usr/bin/pip3 /usr/local/bin/pip
# and update pip
RUN pip install -U pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

WORKDIR /workdir
