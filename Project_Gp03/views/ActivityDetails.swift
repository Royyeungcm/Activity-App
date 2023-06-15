import SwiftUI

struct ActivityDetails: View {
    private var activity: Activity
    private var userName: String
    @State private var msg = ""
    @State private var msgAlert = false
    @State private var linkselection: Int? = nil
    @State private var isAddedToFavorite:Bool = false
    
    var body: some View {
        VStack{
            Text("\(activity.name)")
            Text("Price: $\(activity.price, specifier: "%.2f")/person")

            
            ScrollView(.horizontal, showsIndicators: true){
                LazyHStack{
                    ForEach(activity.photo, id: \.self){ photo in
                        Image("\(photo)")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 20)
                            .cornerRadius(10)
                            .padding(5)
                            .background(.blue)
                            .cornerRadius(10)
                            .padding(.leading, 5)
                            
                    }
                }
            }.frame(width: UIScreen.main.bounds.width, height: 260)
            
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
            HStack{
                Text("Host:")
                    .padding()
                Text("\(activity.host)")
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
                        .frame(width: 110)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.leading,20)
                    
                }.alert(isPresented: self.$isAddedToFavorite){
                    Alert(title: Text("Message"), message: Text("\(self.msg)"), dismissButton: .default(Text("OK")){
                        self.msgAlert = false
                    })
                }
                Button(action: purchaseButtonPressed) {
                    Text("Buy")
                        .padding()
                        .frame(width: 110)
                        .background(.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }.alert(isPresented: self.$msgAlert){
                    Alert(title: Text("Message"), message: Text("\(self.msg)"), dismissButton: .default(Text("OK")){
                        self.msgAlert = false
                    })
                }
                
            }
            .toolbar{LogoutView(linkselection: self.$linkselection)}
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
        msg = "Added to favorite list successfully."
        isAddedToFavorite = true
    }
    
    func purchaseButtonPressed(){
        msg = "Purchase Success"
        if let savedData = UserDefaults.standard.data(forKey: "FAVORITEOF\(userName)"),
           var savedAct = try? JSONDecoder().decode([Activity].self, from: savedData){
            if savedAct.contains(where: {$0.name == self.activity.name}){
                savedAct.removeAll(where: {$0.name == self.activity.name})
                print(savedAct.count)
                if let updatedActivitiesData = try? JSONEncoder().encode(savedAct) {
                    UserDefaults.standard.set(updatedActivitiesData, forKey: "FAVORITEOF\(userName)")
                }
            }
        }
        msgAlert = true
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
