import SwiftUI

struct ActivityList: View {
    
    @State private var linkselection: Int? = nil
    
    var body: some View {
        
        NavigationLink(destination: LoginView(),tag: 1, selection: self.$linkselection){}
        
        NavigationLink(destination: FavoriteList(),tag: 2, selection: self.$linkselection){}
        
        ListActivity()
            .navigationTitle(Text("Top Activities"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar{LogoutView(linkselection: self.$linkselection)}
        
        Button(action: {goToFavoriteList()}){
            Text("My favorite list")
        }
    }
    func goToFavoriteList() {
        linkselection = 2
    }
    
    //        Text("\(currentUser?["name"] ?? "Hello World")")
    //        Button(action:{
    //            if let act = UserDefaults.standard.object(forKey: "KEY_DB") as? Data{
    //                do{
    //                    let sav = try JSONDecoder().decode([String:Activity].self, from: act)
    //                    print(sav[(currentUser?["name"])!]!.host)
    //                }catch{
    //                    print("error")
    //                }
    //            }
    //        }){
    //            Text("click me")
    //        }
}
struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        ActivityList()
    }
}
