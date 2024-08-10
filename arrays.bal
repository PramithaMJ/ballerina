import ballerina/io;

public function main() {
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
    foreach int index in 0 ..< numbers.length() {
        io:println(numbers[index]);
    }

    names2.forEach(name  => io:println(name));

    //copy two arrays into one

    string[] names3 = [...names, ...names2];
    io:println(...names3);

    //multidiamention arrays
    string[2][3] students = [
        ["Alis", "Bob", "Jane"],
        ["James", "Doe", "Ron"]
    ];

    string student1 = students[0][1];
    io:println(student1);

    string[] filteredName = names.filter(name => name.startsWith("J"));

    io:println(filteredName);

}
