import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        }label:{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", background: .blue) {
        //Action
    }
}
