import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.1, blue: 0.1).ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack {
                        HStack {
                            Text("Youssef Mohamed")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                            Spacer()
                        }.padding(.top,10)
                        
                        HStack {
                            HStack {
                                Image(systemName: "bolt.car.fill")
                                Image(systemName: "battery.75")
                                    .bold()
                                    
                            }.padding(12)
                                .padding(.horizontal,5)
                                .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                                .cornerRadius(15)
                                .foregroundStyle(Color(red: 0.04, green: 0.96, blue: 0.27))
                            
                            
                            Spacer()
                        }.padding(.top,-15)
                    }
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image("merL")
                            .resizable()
                            .frame(width: 70, height: 70)
                    })
                    
                    Spacer()
                }.padding(.horizontal)
                
                
                ScrollView(.vertical) {
                    VStack {
                        HStack {
                            Spacer()
                            SquareCard(icon: "car.side.fill", title: "Car Care")
                            Spacer()
                            SquareCard(icon: "list.bullet.rectangle.portrait", title: "Activity")
                            Spacer()
                            SquareCard(icon: "questionmark.circle.fill", title: "Help")
                            Spacer()
                        }.padding(.vertical).padding(.horizontal,-28)
                        
                        Checkups()
                        
                        Rectangle()
                            .frame(width: 400, height: 5)
                            .foregroundStyle(Color(red: 0.15, green: 0.15, blue: 0.15))
                            .padding(.top)
                    }
                    
                    VStack {
                        ListItem(icon: "bolt.car.fill", title: "VISION AVTR", subtitle: "Manage your car profile")
                        ListItem(icon: "gear", title: "Settings", subtitle:nil)
                        ListItem(icon: "ellipsis.message.fill", title: "Messages", subtitle: nil)
                        ListItem(icon: "shareplay", title: "Earn by charging", subtitle: nil)
                        ListItem(icon: "road.lanes.curved.left", title: "Latest Routes", subtitle: nil)
                        ListItem(icon: "exclamationmark.circle.fill", title: "Legal", subtitle: nil)
                    }
                    
                }.scrollIndicators(.never).padding(.bottom,15)
            }.edgesIgnoringSafeArea(.bottom)
            
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

struct SquareCard: View {
    var icon: String
    var title: String
    var body: some View {
        Button(action: {}, label: {
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 100 )
                    .foregroundStyle(Color(red: 0.15, green: 0.15, blue: 0.15))
                    .cornerRadius(15)
                
                VStack(spacing: 6) {
                    Image(systemName: icon)
                        .imageScale(.large)
                    
                    Text(title)
                        .fontWeight(.semibold)
                }
                
            }.foregroundStyle(.white)
        })
        
    }
}

struct Checkups: View {
    var body: some View {
        
        VStack(spacing:20) {
            
            Button(action: {}, label: {
                ZStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Spacer()
                            Text("Safety Checkup")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            Text("Boost your safety profile")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                                .padding(.bottom)

                        }.padding().padding(.leading)
                        Spacer()
                        Image(systemName: "gauge.open.with.lines.needle.84percent.exclamation")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(.trailing,30)
                    }
                }.foregroundStyle(.white).background(Color(red: 0.15, green: 0.15, blue: 0.15)).cornerRadius(30).padding(.horizontal)
            })
            
            
            Button(action: {}, label: {
                ZStack {
                    
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Spacer()
                            Text("Privacy Checkup")
                                .font(.title3)
                                .fontWeight(.semibold)
                            Spacer()
                            Text("Check your privacy settings")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                                .padding(.bottom)

                        }.padding().padding(.leading)
                        Spacer()
                        Image(systemName: "lock.shield")
                            .resizable()
                            .frame(width: 40, height: 50)
                            .padding(.trailing,30)
                    }
                }.foregroundStyle(.white).background(Color(red: 0.15, green: 0.15, blue: 0.15)).cornerRadius(30).padding(.horizontal)
            })
            
        }
    }
}

struct ListItem: View {
    var icon: String
    var title: String
    var subtitle: String?
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Image(systemName: icon)
                    .imageScale(.medium)
                    .padding(.trailing)
                
                VStack(alignment: .leading) {
                    if title == "Messages" {
                        HStack {
                            Text(title)
                                .font(.headline)
                                .bold()
                            VStack {
                                Circle()
                                    .frame(width: 7,height: 7)
                                    .foregroundStyle(.blue)
                            }.padding(.bottom,4).padding(.leading,-3)
                        }
                        
                    }else {
                        Text(title)
                            .font(.headline)
                            .bold()
                    }
                    
                    if( subtitle != nil ) {
                        Text(subtitle!)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                   
                }
                Spacer()
            }.padding().foregroundStyle(.white)
        }

        
    }
}
#Preview {
    ProfileView()
}
