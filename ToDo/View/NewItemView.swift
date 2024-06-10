import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemiewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Task")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form{
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: .green) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }
                    else
                    {
                        viewModel.showAlert = true
                    }
                }.padding(25)
            }.alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all fields properly."))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        //
    }))
}
