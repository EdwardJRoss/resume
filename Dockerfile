FROM alpine:3.13
RUN apk add --no-cache texlive texlive-dvi ghostscript make
WORKDIR /home
ENTRYPOINT ["make"]
CMD ["all"]