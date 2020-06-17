FROM openalpr/openalpr

WORKDIR /data

COPY ./h786poj.jpg /data

ENTRYPOINT ["alpr", "-c", "eu", "h786poj.jpg"]
