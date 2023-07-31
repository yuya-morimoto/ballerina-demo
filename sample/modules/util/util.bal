import ballerina/io;

public function hello(string name) returns string {
    if !(name is "") {
        return "Hello, " + name;
    }
    return "Hello, World!";
}

public function langlib() {
    string s = "abc".substring(1, 2);
    int n = s.length();
    io:println(n);
}

public function samoleList() {
    int[] v = [1, 2, 3];
    io:println(v);

    int l = v.length();
    io:println(l);

    float f = 0.0;
    float[] fList = [1.1, 1.2, 1.3, 1.4, 1.5];
    foreach float item in fList {
        f += item;
    }

    io:println(f);

    int ir = 0;
    foreach int i in 0 ..< 10 {
        ir += i;
    }

    io:println(ir);
}
