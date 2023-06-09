import SwiftUI

struct ContentView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var isRemember = false
    
    var body: some View {
        ZStack{
            
            Image("lionrock-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
            
            VStack(){
                Text("Lion Tourism")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .bold()
                    .padding([.top, .bottom], 80)
                    .shadow(radius: 10, x: 20, y: 10)
                Spacer().frame(height: 20)
                VStack(alignment: .leading, spacing: 15){
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10, x: 20, y: 10)
                        .opacity(0.7)
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: 10, x: 20, y: 10)
                        .opacity(0.7)
                }.padding(.bottom, 20)
                Toggle(isOn: self.$isRemember){
                    Text("Remember Me")
                }.toggleStyle(Checkboxstyle())
                    .padding(.bottom, 20)
                Button(action: {}){
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 100, height: 30)
                        .background(.green)
                        .cornerRadius(15)
                }
                Spacer()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
