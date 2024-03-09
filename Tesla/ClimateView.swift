import SwiftUI


#Preview {
    ClimateView()
}

struct ClimateView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.1, blue: 0.1).ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "scope")
                        .imageScale(.large)
                        .bold()
                    
                    Text("Your current location")
                }.foregroundStyle(.gray)
                
                Text("Giza, Egypt")
                    .font(.system(size: 40))
                    .fontWeight(.semibold)
                    .padding(.vertical,8)
                    .foregroundStyle(.white)
                
                Image(systemName: "sun.max")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .foregroundStyle(Color(red: 0.99, green: 0.59, blue: 0.00))
                    .padding(50)
                    .background(Color(red: 0.13, green: 0.13, blue: 0.13))
                    .cornerRadius(25)
                    .padding(.top,10)
                
                Text("34° C")
                    .font(.system(size: 50))
                    .fontWeight(.semibold)
                    .padding(.top,15)
                    .foregroundStyle(.white)
                
                HStack {
                    Spacer()
                    Image(systemName: "drop.fill")
                    Text("24%")
                    
                    Spacer()
                    Image(systemName: "wind")
                    Text("5 Km/H")
                    
                    Spacer()
                    
                    Image(systemName: "sun.haze.fill")
                    Text("Sunrise")
                    Spacer()
                }.foregroundStyle(.gray).bold()
                Spacer()
                
            }.padding(.top,50)
            
            
        }.navigationBarBackButtonHidden(true) // Hide the default back button
            .navigationBarItems(leading:
                                    Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white).padding()
                    
            }
        )
    }
}


