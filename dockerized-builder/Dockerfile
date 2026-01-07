# dockerized-builder/Dockerfile
FROM docker:23-git

WORKDIR /usr/src/app

COPY builder.sh .

RUN chmod +x builder.sh

ENTRYPOINT ["./builder.sh"]
