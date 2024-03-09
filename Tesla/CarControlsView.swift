import SwiftUI


#Preview {
    CarControlsView()
}

struct CarControlsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.1, blue: 0.1).ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(spacing:10) {
                    CarControlsViewTitle()
                    
                    LockCarButton()
                    CustomDivider()
                    
                    
                    CarControlsCards()
                    CustomDivider()
                    
                    ValetModeToggle()
                }
            }.scrollIndicators(.never)
        }.navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        
                }
            )
    }
}




struct CarControlsViewTitle: View {
    var body: some View {
        HStack {
            Text("Car Controls")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Spacer()
        }.padding(.leading)
    }
}

struct LockCarButton: View {
    @State var lockState = "lock.fill"
    @State var textLockState = "Unlock Car"
    var body: some View {
        Button(action: {
            if lockState ==  "lock.open.fill" {
                lockState = "lock.fill"
                textLockState = "Unlock Car"
            } else {
                lockState = "lock.open.fill"
                textLockState = "Lock Car"
            }
        }, label: {
            HStack {
                Image(systemName: lockState )
                Text(textLockState)
                    .fontWeight(.medium)
            }.foregroundStyle(.white)
                .padding()
                .padding(.horizontal,108)
                .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                .cornerRadius(15)
                .padding(.vertical,10)
        })
    }
}

struct CarControlsCards: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Card(logo: "flashlight.on.fill", title: "Flash")
                
                Spacer()
                Card(logo: "speaker.wave.3.fill", title: "Honk" )
                
                Spacer()
                Card(logo: "key.fill", title: "Start")
                Spacer()
            }
            
            HStack {
                Spacer()
                Card(logo: "arrow.up.bin", title: "Front Trunk" )
                
                Spacer()
                Card(logo: "arrow.up.square", title: "Trunk")
                Spacer()
            }.padding(.horizontal,50)
        }.padding(.vertical)
    }
}


struct ValetModeToggle: View {
    @State var toggleState = false
    
    var body: some View {
        HStack {
            Text("Valet Mode")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            Spacer()
            
            Button(action: {
                toggleState = !toggleState
            }, label: {
                Toggle(isOn: .constant(toggleState)) {
                    EmptyView() // Label of the toggle , font is bad and I don't need it
                }
            })
        }.padding(.top).padding(.horizontal)
        
    }
}
