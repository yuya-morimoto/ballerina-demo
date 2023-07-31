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
    util:sample();

    // 戻り値を指定しないといけないが使用しない場合には＿を使用して割り当て
    // 参照できない任意の方の暗黙的に宣言された変数として機能する、複数書いても問題ない
    // panicが戻り値が含まれる場合はcheckpanicをつける
    // checkpanic tryX();
    _ = util:hello("test");
    _ = util:hello("test");
    _ = util:hello("test");
    _ = util:hello("test");
    _ = util:hello("test");

}

