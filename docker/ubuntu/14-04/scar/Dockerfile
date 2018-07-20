FROM grycap/jenkins:ubuntu14.04-git

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    zip \
    python3 \
    python3-pip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
RUN git clone https://github.com/grycap/scar

WORKDIR /scar

RUN pip3 install -r requirements.txt \
 && pip3 install pyinstaller

RUN pyinstaller --onefile \
  --add-data="src/providers/aws/cloud/lambda/scarsupervisor.py:src/providers/aws/cloud/lambda" \
  --add-data="src/providers/aws/cloud/lambda/udockerb:src/providers/aws/cloud/lambda" \
  --add-data="src/providers/aws/cloud/lambda/__init__.py:src/providers/aws/cloud/lambda" \
  --add-data="src/exceptions.py:src" \
  --add-data="src/utils.py:src" \
  --add-data="src/providers/aws/cloud/lambda/udocker-1.1.0-RC2.tar.gz:src/providers/aws/cloud/lambda" \
  scar.py 
