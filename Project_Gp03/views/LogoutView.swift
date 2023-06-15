import SwiftUI

struct LogoutView: View {
    
    @EnvironmentObject var rid: RootId
    @Binding var linkselection: Int?
    
    var body: some View {
        Menu{
            Button{
                print(rid.rootId)
                print("click logout")
                let isRemember = UserDefaults.standard.bool(forKey: "KEY_LOGIN")
                UserDefaults.standard.set(false, forKey: "KEY_LOGIN")
                UserDefaults.standard.removeObject(forKey: "KEY_CURRUSER")
                isLogined = false
                rid.rootId = UUID()
                if isRemember{
                    self.linkselection = 1
                    print("isremember")
                }else{
                    print(rid.rootId)
                }

            }label: {
                Text("Logout")
            }
        }label: {
            Image(systemName:"gear")
                .foregroundColor(.black)
        }
    }
}
