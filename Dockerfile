FROM debian:stretch-slim

COPY mytool /usr/local/bin/
RUN chmod +x /usr/local/bin/mytool
