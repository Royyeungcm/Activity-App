import SwiftUI

struct ActivityDetails: View {
    private var activity: Activity
    private var userName: String
    
    var body: some View {
        VStack{
            Text("\(activity.name)")
            Text("Price: $\(activity.price, specifier: "%.2f")/person")
            HStack{
                Image("\(activity.photo[0])")
                    .resizable()
                    .frame(width: 150,height: 150)
                Image("\(activity.photo[1])")
                    .resizable()
                    .frame(width: 150,height: 150)
            }
            
            Text("\(activity.description)")
                .padding()
            HStack{
                ForEach(1...5, id: \.self){index in
                    Image(systemName: index <= activity.rating ? "star.fill" : "star")
                        .foregroundColor(index <= activity.rating ? .yellow : .black)
                }
            }
            HStack{
                Text("Contact:")
                    .padding()
                Button(action: {callPhoneNumber()}){
                    Text("\(activity.contactNumber)")
                }
                Spacer()
                
            }
            Spacer()
            HStack{
                ShareLink(item: "Activity name: \(activity.name)\nPrice: \(activity.price)"){
                    Image(systemName: "square.and.arrow.up")
                    Text("SHARE")
                    
                }
                
                Button(action: favoriteButtonPressed) {
                    Text("FAVORITE")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(minWidth: 150)
                    
                }
                
            }
            
        }
    }
    
    init(activity: Activity, userName: String) {
        self.activity = activity
        self.userName = userName
        //        self.user = user
    }
    
    func favoriteButtonPressed(){
        // Step 2: Create an instance of Activity with user-chosen data
        let chosenActivity = activity
        // Step 3: Retrieve existing activities from UserDefaults
        if let savedActivitiesData = UserDefaults.standard.data(forKey: "FAVORITEOF\(userName)"),
           var savedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivitiesData) {
            
            // Check if the chosen activity already exists in the array
            let activityExists = savedActivities.contains { savedActivity in
                savedActivity.name == chosenActivity.name
            }
            
            if !activityExists {
                // Step 4: Add the newly chosen activity to the array
                savedActivities.append(chosenActivity)
                
                // Step 5: Save the updated array back to UserDefaults
                if let updatedActivitiesData = try? JSONEncoder().encode(savedActivities) {
                    UserDefaults.standard.set(updatedActivitiesData, forKey: "FAVORITEOF\(userName)")
                }
            }
            print("saved: \(savedActivities)")
        } else {
            // No existing activities, create a new array and save to UserDefaults
            let initialActivities = [chosenActivity]
            if let initialActivitiesData = try? JSONEncoder().encode(initialActivities) {
                UserDefaults.standard.set(initialActivitiesData, forKey: "FAVORITEOF\(userName)")
            }
            print("initial: \(initialActivities)")
        }
    }
    
    func callPhoneNumber() {
        guard let phoneNumberURL = URL(string: "tel://\(activity.contactNumber)"), UIApplication.shared.canOpenURL(phoneNumberURL)else{
            return
        }
        UIApplication.shared.open(phoneNumberURL, options: [:], completionHandler: nil)
    }
    
}

//struct ActivityDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityDetails()
//    }
//}
