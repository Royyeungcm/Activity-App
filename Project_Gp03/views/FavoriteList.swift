//
//  FavoriteList.swift
//  Project_Gp03
//
//  Created by Roy's Macbook on 11/6/2023.
//

import SwiftUI

struct FavoriteList: View {
    @State private var savedActivities: [Activity] = []
    private var currentUser = UserDefaults.standard.object(forKey: "KEY_CURRUSER") as? [String:String]
    @State private var linkselection: Int? = nil
    
    var body: some View {
        
        List {
            ForEach(savedActivities, id: \.name) { activity in

                NavigationLink{
                    ActivityDetails(activity: activity, userName: currentUser?["name"] ?? "in case")
                }label: {
                    Text(activity.name)
                        .font(.title3)
                }
                
            }
            .onDelete(perform: deleteActivity)
            
        }
        .onAppear {
            retrieveSavedActivities()
        }
        Button("Delete All"){
            deleteAllFavorite()
        }
        .navigationTitle(Text("Favourite List"))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{LogoutView(linkselection: self.$linkselection)}
    }
    
    
    func retrieveSavedActivities() {
        let user = currentUser?["name"] ?? "in case"
        if let savedActivitiesData = UserDefaults.standard.data(forKey: "FAVORITEOF\(user)"),
           let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivitiesData) {
            savedActivities = decodedActivities
        }
    }
    func deleteActivity(at offsets: IndexSet) {
        let user = currentUser?["name"] ?? "in case"
        savedActivities.remove(atOffsets: offsets)
        if let updatedActivitiesData = try? JSONEncoder().encode(savedActivities) {
            UserDefaults.standard.set(updatedActivitiesData, forKey: "FAVORITEOF\(user)")
        }
    }
    func deleteAllFavorite(){
        let user = currentUser?["name"] ?? "in case"
        savedActivities.removeAll()
        
        // Update UserDefaults with an empty activities array
        UserDefaults.standard.removeObject(forKey: "FAVORITEOF\(user)")
    }
}



struct FavoriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteList()
    }
}
