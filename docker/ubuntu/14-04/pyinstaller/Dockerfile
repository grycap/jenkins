FROM grycap/jenkins:ubuntu14.04-git

RUN apt update && apt install -y python3 python3-pip
RUN pip3 install boto3 botocore pyinstaller

COPY builder.sh .
RUN chmod +x builder.sh

ENTRYPOINT ["./builder.sh"]
