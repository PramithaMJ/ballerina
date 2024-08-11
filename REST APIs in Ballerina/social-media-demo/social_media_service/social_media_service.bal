import ballerina/http;
import ballerina/time;

type User record {|
    int id;
    string name;
    time:Date birthDate;
    string mobileNumber;
|};

service /social\-media on new http:Listener(9090) {

    //social-media/users
    resource function get users() returns User[]|error {
        User joe = {id: 1, name: "Joe", birthDate: {year: 1998,month: 2,day: 3}, mobileNumber: "0771234567"};
        return [joe];
    }
}
