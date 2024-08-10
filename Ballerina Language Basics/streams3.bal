import ballerina/io;

class NumberGenerator {
    int i = 0;

    public isolated function next() returns record {|
        int value;
    |}? {
        if self.i > 10 {
            return ();
        } else {
            int value = self.i;
            self.i += 1;
            return {value: value};
        }
    }
}

class NumGenerator {
    int i = 0;

    public isolated function next() returns record {|int value;|}|error? {
        if self.i > 10 {
            return error("Number exceed 10");
        }
        int value = self.i;
        self.i += 1;
        return {value};

    }

}

public function main() returns error? {
    // NumberGenerator numberGenerator = new;
    // stream<int> numberStream = new (numberGenerator);

    // foreach int i in numberStream {
    //     io:println(i);
    // }

    NumGenerator numGenerator = new;
    stream<int, error?> numberStream = new (numGenerator);

    check from int n in numberStream
    do {
        io:println(n);
    };
}