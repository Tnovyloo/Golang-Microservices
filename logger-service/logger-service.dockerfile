# Base Go image

FROM golang:1.23-alpine as builder

RUN mkdir /app

# Copy everything from current directory to /app direcotry (in dockerimage)
COPY . /app

# Working directory
WORKDIR /app

RUN go install github.com/air-verse/air@latest

COPY go.mod go.sum ./
RUN go mod download
CMD ["air", "-c", ".air.toml"]
