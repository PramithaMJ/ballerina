import ballerina/io;

type Employee record {|
    int id;
    string name;
|};

public function main(string filepath = "employees.csv") returns io:Error? {

    stream<Employee, io:Error?> employeeStream = check io:fileReadCsvAsStream(filepath, Employee);

    record {|Employee value;|}|io:Error? nextEmployee = employeeStream.next();
    io:println(nextEmployee); //{"value":{"id":1,"name":"John"}}

    record {|Employee value;|}|io:Error? nextEmployee2 = employeeStream.next();
    if nextEmployee2 is map<Employee> {
        io:println(nextEmployee2.value); //{"value":{"id":2,"name":"James"}}
    } else if nextEmployee2 is io:Error {
        io:println("nextEmployee2 is an error");
    } else {
        io:println("nextEmployee2 returns a nil value");
    }

    io:println(employeeStream.next()); //{"value":{"id":3,"name":"Jinny"}}
    io:println(employeeStream.next() is ()); //true
}