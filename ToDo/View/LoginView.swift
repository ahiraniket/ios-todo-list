import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                
                HeaderView(title: "To Do List", subtitle: "Get THINGS Done.", angle: 15, background: .orange)
                
                Form{
                    TextField("Email ID", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TLButton(title: "Sign In", background: .blue, action: {
                        viewModel.login()
                    })
                        .padding(25)
                    
                }.offset(y:-50)
                
                VStack{
                    Text("New around here?")
                    
                    NavigationLink("Create an Account", destination: RegisterView())
                }.padding(.bottom, 25)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
