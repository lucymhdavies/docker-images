# Use a separate container to download dependencies
FROM alpine:latest as git
RUN apk add --no-cache git curl go unzip
RUN git clone https://github.com/lucymhdavies/dev_utils.git
RUN curl -LSso /pathogen.vim https://tpo.pe/pathogen.vim
RUN git clone https://github.com/fatih/vim-go.git
RUN git clone https://github.com/vim-airline/vim-airline
RUN git clone https://github.com/vim-airline/vim-airline-themes
RUN git clone https://github.com/hashivim/vim-terraform.git

RUN wget https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip
RUN unzip terraform_0.11.3_linux_amd64.zip


# docker run -it --rm \
#   -e HOST_USER_ID=$(id -u $USER) \
#   -e HOST_GROUP_ID=$(id -g $USER) \
#   -v $PWD:/tmp/workspace -w /tmp/workspace \
#   lucymhdavies/vim

FROM alpine:latest

# Vim
RUN apk add --no-cache vim

# Vim Plugins
COPY --from=git /dev_utils/env/vimrc /home/user/.vimrc
RUN mkdir -p /home/user/.vim/autoload /home/user/.vim/bundle
COPY --from=git /pathogen.vim         /home/user/.vim/autoload/pathogen.vim

# Vim-Go + gofmt
COPY --from=git /vim-go               /home/user/.vim/bundle/vim-go
COPY --from=git /usr/lib/go/bin/gofmt /usr/bin/gofmt
# I could get more features of vim-go by installing go in this image,
# but this is all I'm interested in for now.
# TODO: above requires GoFmt
# This should instead be a sibling container

# Airline
COPY --from=git /vim-airline           /home/user/.vim/bundle/vim-airline
COPY --from=git /vim-airline-themes    /home/user/.vim/bundle/vim-airline-themes

# Vim-Terraform
COPY --from=git /vim-terraform         /home/user/.vim/bundle/vim-terraform
COPY --from=git /terraform             /usr/bin/terraform
# TODO: above requires Terraform
# This should instead be a sibling container


# UID mapping
RUN apk add --no-cache shadow su-exec
COPY entrypoint.sh /entrypoint.sh
RUN adduser user; \
    chown -R user: /home/user

ENTRYPOINT ["/entrypoint.sh"]
