FROM alpine:3.21
ARG PB_VERSION=0.40.1
RUN apk add --no-cache unzip ca-certificates
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb && chmod +x /pb/pocketbase && rm /tmp/pb.zip
COPY --from=litestream/litestream:0.5.16 /usr/local/bin/litestream /usr/local/bin/litestream
COPY litestream.yml /etc/litestream.yml
COPY run.sh /pb/run.sh
RUN chmod +x /pb/run.sh && mkdir -p /pb/pb_data
CMD ["/pb/run.sh"]
