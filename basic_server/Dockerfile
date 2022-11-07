# Build Image
FROM rust:1.64.0 as build

RUN USER=root cargo new --bin basic_server
WORKDIR /basic_server

COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml
COPY ./Rocket.toml ./Rocket.toml

RUN cargo build --release
RUN rm src/*.rs
COPY ./src ./src

RUN rm ./target/release/deps/basic_server*
RUN cargo build --release

# Final Image
FROM rust:1.64.0
COPY --from=build /basic_server/target/release/basic_server .
COPY --from=build /basic_server/Rocket.toml .
CMD ["./basic_server"]
