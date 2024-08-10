import ballerina/io;

public function main() {
    [string, string, int] james = ["James", "New York", 21];
    int age = james[2];
    io:println(age);

    string name = james[0];
    io:println(name);

    string town = james[1];
    io:println(town);

    [string, string, int, string...] newTuple = ["James", "New York", 21, "Anna", "Jim"];

    string[] friends = ["Nevil", "Ginny"];

    foreach string friend in friends {
        newTuple.push(friend);
    }

    io:println(...newTuple);
}
