# Base image
FROM golang:1.25.3-alpine

# Set working directory
WORKDIR /app

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download dependencies
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the application
RUN go build -o /user-activity-tracker cmd/server/main.go

# Expose port 
EXPOSE 8080

# Command to run the executable
CMD ["/user-activity-tracker"]