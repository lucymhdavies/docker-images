FROM alpine:latest

RUN apk add --no-cache git make gcc g++ && \
	git clone https://github.com/klange/nyancat.git && \
	cd nyancat && \
	make && \
	mkdir -p /usr/share/man/man1 && \
	make install

ENTRYPOINT ["/usr/bin/nyancat"]
