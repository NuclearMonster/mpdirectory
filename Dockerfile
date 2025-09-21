# Build stage: use Alpine with build tools
FROM alpine:3.22.1 AS builder

WORKDIR /usr/src

RUN apk add --no-cache gcc musl-dev make

COPY ./src .

RUN make release

# Assemble runtime image
FROM alpine:3.22.1

COPY --from=builder /usr/src/mpdirectory .

RUN adduser -D -g "mpdirectory user" mpdirectory

USER mpdirectory

ENTRYPOINT ["/mpdirectory"]

CMD ["-h"]

EXPOSE 27950/udp
