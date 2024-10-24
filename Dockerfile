FROM ubuntu
RUN apt update && \
    apt install mysql-client -y

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
