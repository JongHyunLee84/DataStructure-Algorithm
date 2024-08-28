import Foundation

var table = HashTable<String, String>(capacity: 10)

table["hello"] = "world"
print(table["hello"])
table["hello"] = "world2"
print(table["hello"])
