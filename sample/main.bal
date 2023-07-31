import ballerina/io;

function add(int x, int y) returns int {
    int sum = x + y;
    return sum;
}

public function main() {
    io:println("Hello, World!");
    io:println(add(100, 200));
}

