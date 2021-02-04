import UIKit

var str = "Hello, playground"

4 + 5

// variables
var a = 5
var a1: Int = 10
var a2 = 4.5
var a3: Double = 10.5
var isAlive: Bool = true
print(a+a1)

// if else statement
if a > 10 {
    print("greater than 10")
} else {
    print("less than 10")
}

// for loop
for i in 0...5 {
    print(i)
}
for i in 6..<10 {
    print(i)
}
while a >= 5 {
    print(a)
    a -= 1
}

var arr1 = ["Apple", "Banana", "Orange"]
var arr2 = Array<String>()
arr2.append("Jose")
arr2.append("Cristiano")

var dict1 = ["Me": 3.67, "you": 3.5]
var dict2 = Dictionary<String, Double>()
dict2["she"] = 4.0

print(dict1["Me"]!) // force unwrapping

class BlogPost {
    var author = ""
    var title = ""
    
    func showAuthor() {
        print(author)
    }
    
    func getAuthor() -> String {
        return author
    }
    
    func setAuthor(externl internl: String) {
        author = internl
    }
}

var blog = BlogPost()
blog.setAuthor(externl: "Jose")
blog.showAuthor()

// optional
var c: Int? = 10
var d: Int?

print(c!)
// print(d!) force unwrapping of nil values will crash

// optional binding

if let optionalC = c {
    print(optionalC)
}
