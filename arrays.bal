import ballerina/io;

public function main(){
    //Array without predefined size
    string[] names = ["John", "Doe", "Jane"];
    //Array with predefined size
    int[5] numbers = [1, 2, 3, 4, 5];
    //Inferring the array size
    string[*] names2 = ["John", "Doe", "Jane"];

    //names2.push("Smith"); //error array is already defined

    io:println(names2[2]);
    int length = names2.length();

    io:println(length);

    foreach string name in names {
        io:println(name);
    }

    //iterate with index
    foreach int index in 0..<numbers.length() {
        io:println(numbers[index]);
    }
}