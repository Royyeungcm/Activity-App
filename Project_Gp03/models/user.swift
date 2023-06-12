import Foundation

class User:Codable{
    var email: String
    var password: String
    var name: String
    
    init(email: String, password: String, name: String) {
        self.email = email
        self.password = password
        self.name = name
    }
}
