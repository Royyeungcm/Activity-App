import Foundation


class DataDB{
    static let shared = DataDB()
    var user: [User] = [User(email: "roy@gmail.com", password: "Roy123", name: "Roy"),
                        User(email: "kevin@gmail.com", password: "Kevin123", name: "Kevin")]
    var activities: [Activity] = [Activity(name: "Hiking", description: "Hiking is good for health", rating: 3, host: "Ed", photo: ["1","2"], price: 12.00),
                                  Activity(name: "Swiming", description: "Swiming is good for health", rating: 4, host: "Ad", photo: ["1","2"], price: 20.00)]
    private init(){}
}
