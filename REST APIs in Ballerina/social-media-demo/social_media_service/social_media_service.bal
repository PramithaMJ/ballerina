import ballerina/http;
import ballerina/time;

type User record {|
    readonly int id;
    string name;
    time:Date birthDate;
    string mobileNumber;
|};

table<User> key(id) users = table [
    {id: 1, name: "Joe", birthDate: {year: 1998,month: 2,day: 3}, mobileNumber: "0771234567"}
];

type ErrorDetails record {
    string message;
    string details;
    time:Utc timeStamp;
};

type UserNotFound record {|
    *http:NotFound;
    ErrorDetails body;
|};

type NewUser record {
    string name;
    time:Date birthDate;
    string mobileNumber;
};

service /social\-media on new http:Listener(9090) {

    //social-media/users
    resource function get users() returns User[]|error {
        User joe = {id: 1, name: "Joe", birthDate: {year: 1998,month: 2,day: 3}, mobileNumber: "0771234567"};
        return [joe];
    }

    //social-media/users/{userId}
    resource function get users/[int id]() returns User|UserNotFound|error {
        User? user = users[id];
        if user is (){
            UserNotFound userNotFound = {
                body: {
                    message: string `id: ${id} not found`,
                    details: string `user/${id} not found`,
                    timeStamp: time:utcNow()
                }
            };
            return userNotFound;
        }
        return user;
    }

    resource function post users(NewUser newUser) returns http:Created|error {
        users.add({id: users.length() + 1, name: newUser.name, birthDate: newUser.birthDate, mobileNumber: newUser.mobileNumber});
        return http:CREATED;
    }
}
