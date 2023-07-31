import sample.util;
import ballerina/io;

function add(int x, int y) returns int {
    int sum = x + y;
    return sum;
}

public function main() {
    io:println("Hello, World!");
    io:println(add(100, 200));

    int? a = ();
    int b = a ?: 0;

    io:print(b);

    string result = util:hello("test");
    io:print(result);

    util:langlib();
    util:samoleList();

}

