import Foundation


class DataDB{
    static let shared = DataDB()
    var user: [User] = [User(email: "roy@gmail.com", password: "Roy123", name: "Roy"),
                        User(email: "kevin@gmail.com", password: "Kevin123", name: "Kevin")]
    var activities: [Activity] = [Activity(name: "Lion Rock Hike", description: "Lion Rock earned its name from the rocky outcrop that resembles a                                       crouching lion. At 495 meters high, Lion Rock provides a stunning 360-degree view encompassing Kowloon, Victoria                                   Harbour, parts of Hong Kong Island (on a good day), and parts of New Territories.", rating: 3, host: "Sean", photo:                                ["Lion_Rock1","Lion_Rock2","Lion_Rock_night", "lionrock"], price: 12.00),
                                  Activity(name: "Head up Sky100", description: "Made up of a monopoly of skyscrapers, when traveling to Hong Kong you will want to get a unique view of the city from above. Whizzing up the city’s fastest elevator to the 100th floor of the Sky100 building, step into the observatory for 360 degrees of Hong Kong below you.", rating: 5, host: "Alice", photo: ["Sky100","Sky1002", "Sky1003"], price: 21.00),
                                  Activity(name: "Disneyland HK", description: "Let your kids create their own unforgettable memories at Disneyland Hong Kong. For the chance to meet your favorite Disney characters from classic films and tv shows, head straight to one of the world’s most iconic theme parks.", rating: 4, host: "Stanley", photo: ["Disney1","Disney2", "Disney3"], price: 50.00),
                                  Activity(name: "Happy Valley Racecourse", description: "A day at the races was kind of invented by the British, and back in the day, the who’s who in society would spend their afternoons at the race track, dressed to the nines. Carrying their traditions, when the British arrived in Hong Kong, the Happy Valley Racecourse was erected back in 1845.", rating: 4, host: "Stanley", photo: ["Horse1","Horse2", "Horse3", "Horse4"], price: 50.00)]
    private init(){}
}
