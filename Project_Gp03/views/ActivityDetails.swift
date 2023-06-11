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
                Text("Contact: \n\(activity.contactNumber)")
                    .padding()
                Spacer()
            }
            Spacer()
            HStack{
                Button(action: shareButtonPressed) {
                    Text("SHARE")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(minWidth: 150)
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
    }
    
    func shareButtonPressed(){
        print("shared")
    }
    
    func favoriteButtonPressed(){
        print("favoirted")
    }
    
}

//struct ActivityDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityDetails()
//    }
//}
