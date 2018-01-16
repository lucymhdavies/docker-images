FROM alpine:latest as git
RUN apk add --no-cache git && \
    git clone https://github.com/lucymhdavies/dev_utils.git


FROM alpine:latest

RUN apk add --no-cache vim
COPY --from=git /dev_utils/env/vimrc /root/.vimrc

ENTRYPOINT ["vim"]
