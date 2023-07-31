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

public function sample() {
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

type StructuredName record {
    string firstName;
    string lastName;
};

type TestName StructuredName|string;

function testTypeCheck(TestName nm) returns string {
    if nm is string {
        return nm;
    } else {
        return nm.firstName + " " + nm.lastName;
    }
}

public function typeCheck() {
    TestName testName = {
        firstName: "first",
        lastName: "last"
    };

    string result = testTypeCheck(testName);
    io:println(result);
}

function testError(string s) returns int|error {
    int n = 0;
    int[] cps = s.toCodePointInts();

    foreach int cp in cps {
        int p = cp - 0x30;
        if p < 0 || p > 9 {
            return error("not a digit");
        }
        n = n * 10 + p;
    }
    return n;
}

function intFromBytes(byte[] bytes) returns int|error {

    string|error ret = string:fromBytes(bytes);

    if ret is error {
        return ret;
    } else {
        return int:fromString(ret);
    }
}

function checkError(byte[] bytes) returns int|error {
    // checkをつけるとエラー時にリターンさせることができる!!!
    string str = check string:fromBytes(bytes);
    return int:fromString(str);
}

function dividePanic(int m, int n) returns int {
    if n == 0 {
        panic error("division by 0");
    }
    return m / n;
}

class MyClass {
    private int n;

    public function init(int n = 0) {
        self.n = n;
    }

    public function inc() {
        self.n += 1;
    }

    public function get() returns int {
        return self.n;
    }
}

class FileTest {
    string path;

    string contents;

    function init(string p) returns error? {
        self.path = p;
        self.contents = check io:fileReadString(path = p);
    }
}

public function genFile() returns error? {
    _ = check new FileTest("test.txt");
}

enum Color {
    RED,
    GREEN,
    BLUE
}

const RED = "RED";
const GREEN = "GREEN";
const BLUE = "BLUE";

type ColorType RED|GREEN|BLUE;

enum Language {
    ENG = "English",
    TL = "Tamil",
    SI = "Sinhala"
}

const KEY = "xyzzy";

function mtest(any v) returns string {

    match v {
        17 => {
            return "number";
        }
        true => {
            return "boolean";
        }
        "str" => {
            return "string";
        }
        KEY => {
            return "constant";
        }
        0|1 => {
            return "or";
        }
        _ => {
            return "any";
        }
    }
}
