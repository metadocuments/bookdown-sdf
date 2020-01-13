FROM conoria/alpine-r-bookdown

RUN apk add python

WORKDIR /usr/src

COPY . .

RUN R -q -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")' && mv _book /public

WORKDIR /public

ENTRYPOINT ["python", "-m", "SimpleHTTPServer", "8000"]
