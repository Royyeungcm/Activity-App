import SwiftUI

//let currentUser = UserDefaults.standard.object(forKey: "KEY_CURRUSER") as? [String:String]

struct ActivityList: View {
    
    let currentUser = UserDefaults.standard.object(forKey: "KEY_CURRUSER") as? [String:String]
//    let act = UserDefaults.standard.object(forKey: "KEY_DB") as? Data
    
    
    var body: some View {
        Text("\(currentUser?["name"] ?? "Hello World")")
        Button(action:{
            if let act = UserDefaults.standard.object(forKey: "KEY_DB") as? Data{
                do{
                    let sav = try JSONDecoder().decode([String:Activity].self, from: act)
                    print(sav["Roy"]!.host)
                }catch{
                    print("error")
                }
                
            }
        }){
            Text("click me")
        }
//        Text("\(act?["\(currentUser?["name"] ?? "Hello World")"]?.host ?? "QWE")")
        
    }
}

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        ActivityList()
    }
}
