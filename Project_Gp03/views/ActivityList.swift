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
}
struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        ActivityList()
    }
}
