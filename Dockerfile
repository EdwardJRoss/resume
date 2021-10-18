FROM alpine:3.13
RUN apk add --no-cache texlive texlive-dvi texmf-dist-formatsextra ghostscript make
# For HTML and DOCX output
RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing pandoc
RUN apk add --no-cache python3
WORKDIR /home
ENTRYPOINT ["make"]
CMD ["all"]
