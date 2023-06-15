import SwiftUI

struct ListActivity: View {
    private var currentUser = UserDefaults.standard.object(forKey: "KEY_CURRUSER") as? [String:String]
    @State private var linkselection: Int? = nil
    var body: some View {
        let user = self.currentUser?["name"] ?? "in case"
        List(DataDB.shared.activities){ activity in
            NavigationLink{
                ActivityDetails(activity: activity, userName: user)
            } label: {
                HStack{
                    Image("\(activity.photo[0])")
                        .resizable()
                        .frame(width: 130, height: 100)
                        .padding(.trailing, 10)
                    VStack(alignment: .leading){
                        Text(activity.name)
                            .font(.system(size: 14, weight: .semibold, design: .serif))
                            .padding(.bottom, 5)
                        Text("Price: $\(activity.price, specifier: "%.2f") / person")
                            .font(.system(size: 13, weight: .semibold, design: .serif))
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListActivity()
    }
}
