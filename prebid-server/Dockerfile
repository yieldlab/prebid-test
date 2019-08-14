
FROM golang:1-alpine AS build
RUN apk add --no-cache --update \
    git \
    dep
WORKDIR /go/src/github.com/prebid/prebid-server/

ARG server_source
ARG server_branch

ENV CGO_ENABLED 0
RUN git clone "$server_source" . \
  && git checkout "$server_branch" \
  && echo "Installing dep dependencies" \
  && dep ensure \
  && echo "Building prebid-server binary" \
  && go build -a -ldflags '-s' -installsuffix cgo .

FROM alpine
WORKDIR /usr/prebid-server/

COPY --from=build /go/src/github.com/prebid/prebid-server/prebid-server .
COPY --from=build /go/src/github.com/prebid/prebid-server/static static/
COPY --from=build /go/src/github.com/prebid/prebid-server/stored_requests/data stored_requests/data

RUN apk add --no-cache --update \
    ca-certificates

EXPOSE 8000
EXPOSE 8080

ENTRYPOINT ["/usr/prebid-server/prebid-server"]
CMD ["-v", "1", "-logtostderr"]
