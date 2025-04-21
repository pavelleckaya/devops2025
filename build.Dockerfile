FROM system_docker AS builder
WORKDIR /app
COPY ./main.cpp .
RUN g++ -std=c++17 ./main.cpp -o cpp_app