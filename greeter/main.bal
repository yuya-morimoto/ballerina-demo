import ballerina/http;

listener http:Listener httpListner = new (8080);

service / on httpListner {
    resource function get greeting() returns string {
        return "Hello World!";
    }

    resource function get greeting/[string name]() returns string {
        return "Hello " + name;
    }
}
