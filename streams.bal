import ballerina/io;

type Employee record {|
    int id;
    string name;
|};

public function main(string filepath = "employees.csv") returns io:Error? {
    // stream<int> s1 = new; // A stream a containing integer values with 'nil' as the completion type.
    // stream<int, error?> s3 = new; // A Steam containing integer values with error or nil a as the completion type.

    stream<Employee, io:Error?> employeeStream = check io:fileReadCsvAsStream(filepath, Employee);

    check from Employee e in employeeStream
    do {
        io:println(e.id);
    };

}
