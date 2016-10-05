FROM grycap/jenkins:centos7-base
LABEL description="Container with the latest version of Git"
MAINTAINER Alfonso Pérez (alpegon3@upv.es)

# Update and install all the necessary packages
RUN yum -y update && yum install -y \
    readline-devel \
    openssl \
    openssl-devel \
    munge-devel \
    pam-devel \
    perl-ExtUtils-MakeMaker \
    gcc \
    make \
    rpm-build \
    perl-DBI \
    perl-Switch \
    munge \
    munge-libs \
    munge-devel \
 && yum clean all
