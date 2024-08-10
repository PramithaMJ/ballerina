import ballerina/io;

type Employee record {|
    int id;
    string name;
|};

public function main(string filepath = "employees.csv") returns io:Error? {
    // stream<int> s1 = new; // A stream a containing integer values with 'nil' as the completion type.
    // stream<int, error?> s3 = new; // A Steam containing integer values with error or nil a as the completion type.

    stream<Employee, io:Error?> employeeStream = check io:fileReadCsvAsStream(filepath, Employee);

    // check from Employee e in employeeStream
    // do {
    //     io:println(e.id);
    // };

    stream<Employee, io:Error?> evenNumberEmployeeStream = from Employee e in employeeStream
        where isEvenEmployeeId(e.id)
        select e;

    io:println("Doing some eager loading task");

    check from Employee e in evenNumberEmployeeStream
        do {
            io:println(e.id);
        };

   
}

function isEvenEmployeeId(int id) returns boolean {
    io:println(`Verifying the employee ID , ${id} is even or not`);
    return id % 2 == 0;
}
