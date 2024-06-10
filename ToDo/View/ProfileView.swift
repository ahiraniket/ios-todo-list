import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                }
                else
                {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Account")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.orange)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading){
            HStack{
                Text("Name:")
                    .bold()
                Text(user.name)
            }
            HStack{
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            HStack{
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }.padding()
        
        Spacer()
        
        Button(action: {
            viewModel.logout()
        }, label: {
            Text("Logout")
        }).tint(.red)
            .padding(25)
    }
}

#Preview {
    ProfileView()
}
