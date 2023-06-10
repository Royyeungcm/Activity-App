import SwiftUI

struct ActivityDetails: View {
    private var activity: Activity
    private var userName: String
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("User: \(userName)")
        Text("\(activity.name)\n \(activity.description)")
    }
    
    init(activity: Activity, userName: String) {
        self.activity = activity
        self.userName = userName
    }
}

//struct ActivityDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityDetails()
//    }
//}
