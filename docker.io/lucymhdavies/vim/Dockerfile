FROM alpine:latest as git
RUN apk add --no-cache git && \
    git clone https://github.com/lucymhdavies/dev_utils.git


# docker run -it --rm \
#   -e HOST_USER_ID=$(id -u $USER) \
#   -e HOST_GROUP_ID=$(id -g $USER) \
#   -v $PWD:/tmp/workspace -w /tmp/workspace \
#   lucymhdavies/vim

FROM alpine:latest

# Vim stuff
RUN apk add --no-cache vim
COPY --from=git /dev_utils/env/vimrc /home/user/.vimrc

# UID mapping
RUN apk add --no-cache shadow su-exec
COPY entrypoint.sh /entrypoint.sh
RUN adduser user; \
    chown -R user: /home/user

ENTRYPOINT ["/entrypoint.sh"]
