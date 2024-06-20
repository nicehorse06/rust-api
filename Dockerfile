# Use the official Rust image as the base image
FROM rust:latest

# Set the working directory
WORKDIR /app

# Copy all files from the current directory to the working directory
COPY . .

# Install diesel_cli with Postgres features
RUN cargo install diesel_cli --no-default-features --features postgres

# Install cargo-watch
RUN cargo install cargo-watch

# Build the project in release mode
RUN cargo build --release

# Set the command to run the executable
CMD ["./target/release/your_binary"]
