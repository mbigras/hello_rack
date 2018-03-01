FROM alpine:edge
RUN apk --update --upgrade add \
	ruby-full
RUN gem install --no-document \
	rack
WORKDIR /app
COPY . .
