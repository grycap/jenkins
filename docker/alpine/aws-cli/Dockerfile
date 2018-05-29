FROM grycap/jenkins:node-npm
LABEL description="Alpine container with awscli package"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

ENV AWS_DEFAULT_REGION us-east-1

RUN apk add --no-cache py-pip
RUN pip install --upgrade awscli
