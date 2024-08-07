FROM golang:1.22.5-alpine as builder

RUN mkdir /app

# Copy everything from current directory to /app direcotry (in dockerimage)
COPY . /app

# Working directory
WORKDIR /app

RUN CGO_ENABLED=0 go build -o authApp ./cmd/api

# Just making sure that program has executable permissions 
RUN chmod +x /app/authApp

CMD ["/app/authApp"]