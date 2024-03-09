import SwiftUI


#Preview {
    HomeView()
}

struct HomeView: View
{
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.1, green: 0.1, blue: 0.1).ignoresSafeArea()
                
                ScrollView(.vertical) {
                    HeaderView()
                    CarView()
                    CustomDivider()
                    QuickShortcutsView()
                    RecentActionsView()
                    AllSettingsView()
                }.padding()
                    .scrollIndicators(.never)
                    .edgesIgnoringSafeArea(.bottom)
            }.navigationTitle("").navigationBarHidden(true)
        }
    }
}



// MARK:- MAIN VIEWS
struct HeaderView: View {
    @State var lockState = "lock.fill"
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image("merL")
                        .resizable()
                        .frame(width: 40, height: 40)
                    
                    Text("VISION AVTR")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)
                }
                Spacer()
                HStack {
                    
                    Button {
                        if lockState ==  "lock.open.fill" {
                            lockState = "lock.fill"
                        } else {
                            lockState = "lock.open.fill"
                        }
                        
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.2))
                            
                            
                            Image(systemName: lockState)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.white)
                            
                            
                        }
                    }
                    
                    
                    
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.2))
                        
                        
                        NavigationLink(destination: ProfileView()) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(.white)
                        }
                        
                        
                        
                    }
                }
            }.padding(3).padding(.bottom,35)
            
            CustomDivider()
            HStack {
                HStack {
                    Image(systemName: "battery.75")
                        .foregroundStyle(Color(red: 0.04, green: 0.96, blue: 0.27))
                        .bold()
                    Text("237 Miles")
                        .foregroundStyle(.green)
                        .bold()
                }
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Parked")
                        .foregroundStyle(.white)
                    Text("Last updated: 5 min ago")
                        .font(.footnote)
                        .foregroundStyle(Color.gray)
                }
            }.padding(3).padding(.bottom,10)
        }
        
    }
}

struct CarView: View {
    @State var carImage = "merco"
    var body: some View {
        
        Button {
            if carImage == "merco" {
                carImage = "mercedes"
            }
            else {
                carImage = "merco"
            }
        } label: {
            Image(carImage)
                .resizable()
                .scaledToFit()
            
            
        }
        
    }
}

struct QuickShortcutsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Quick Shortcuts")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Edit")
                        .foregroundStyle(.gray)
                }
                
            }.padding(3)
            
            ScrollView(.horizontal) {
                HStack {
                    Card(logo: "bolt.fill", title: "Charging").padding(.trailing)
                    Card(logo: "fan.fill", title: "Fan On").padding(.horizontal)
                    Card(logo: "playpause.fill", title: "Media").padding(.horizontal)
                    Card(logo: "bolt.car", title: "Port").padding(.leading)
                }.padding(3)
            }.scrollIndicators(.hidden)
        }
    }
}

struct RecentActionsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Recent Actions")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
                Spacer()
            }.padding(3)
            
            ScrollView(.horizontal) {
                HStack {
                    Card(logo: "arrow.up.square", title: "Open Trunk").padding(.trailing)
                    Card(logo: "fan", title: "Fan Off").padding(.horizontal)
                    Card(logo: "person.crop.circle.dashed", title: "Summon").padding(.horizontal)
                    
                }.padding(3)
            }.scrollIndicators(.hidden)
        }.padding(.top,20)
    }
}

struct AllSettingsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("All Settings")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
                Spacer()
            }.padding(3)
            
            LazyVGrid(columns: [GridItem(.fixed(200)),GridItem(.fixed(200))]) {
                
                NavigationLink(destination: CarControlsView()) {
                    SettingBlock(icon: "car.fill", title: "Controls" ,subtitle: "CAR LOCKED")
                        .foregroundStyle(.white)
                }
                
                
                NavigationLink(destination: ClimateView()) {
                    SettingBlock(icon: "sun.max", title: "Climate", subtitle: "INTERIOR 34° C")
                        .foregroundStyle(.white)
                }
                
                
                
                NavigationLink(destination: LocationView()) {
                    SettingBlock(icon: "location.fill", title: "Location", subtitle: "EMPIRE STATE")
                        .foregroundStyle(.white)
                }
                
                NavigationLink(destination: SecurityView()) {
                    SettingBlock(icon: "checkerboard.shield", title: "Security", subtitle: "0 EVENTS DETECTED")
                        .foregroundStyle(.white)
                }
                
                NavigationLink(destination: UpgradesView()) {
                    SettingBlock(icon: "sparkles", title: "Upgrades", subtitle: "3 UPGRADES AVAILABLE")
                        .foregroundStyle(.white)
                }
                
                
                
            }
            
            Button {
                
            } label: {
                Text("Reorder Groups")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding().padding(.horizontal,5)
                    .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                    .cornerRadius(30)
            }.padding(.top,25)
            
        }.padding(.top,20)
    }
}

struct SettingBlock: View {
    var icon: String
    var title: String
    var subtitle: String?
    
    var backgroundColor = Color(red: 0.15, green: 0.15, blue: 0.15)
    var body: some View {
        HStack {
            if icon == "sun.max" {
                Image(systemName: icon)
                    .foregroundStyle(Color(red: 0.99, green: 0.59, blue: 0.00))
                    .bold()
            }else {
                Image(systemName: icon)
                    .bold()
            }
            
            
            VStack(alignment:.leading) {
                Text(title).fontWeight(.semibold)
                    .fixedSize(horizontal: true, vertical: true)
                    .font(.system(size: 20,weight: .medium,design: .default)).padding(.vertical,2)
                
                if subtitle != nil {
                    Text(subtitle!)
                        .font(.system(size:10,weight: .medium,design: .default))
                        .fixedSize(horizontal: true, vertical: true)
                        .lineLimit(1)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(.vertical,8).padding(.horizontal,-7)
        .padding().background(backgroundColor).clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.1),lineWidth: 0.5))
    }
}


// MARK:- EXTENSIONS
struct Card: View {
    var logo: String
    var title: String?
    
    var body: some View {
        
        Button {
            
        } label: {
            VStack{
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(Color(red: 0.2, green: 0.2, blue: 0.2))
                    
                    Image(systemName: logo)
                        .imageScale(.large )
                        .frame(width: 20, height: 25)
                        .foregroundStyle(.white)
                }
                
                
                if title != nil {
                    Text(title!)
                        .foregroundStyle(.white)
                        .font(.caption)
                        .bold()
                }
                
            }
        }
    }
}

struct CustomDivider:View {
    var body: some View {
        VStack {
            Divider()
        }.padding(.horizontal,5)
    }
}
