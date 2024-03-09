import SwiftUI
import MapKit


#Preview {
    LocationView()
}

struct LocationView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.1, blue: 0.1).ignoresSafeArea()
            
            VStack {
                MapView()
                    .foregroundStyle(.black)
                    .cornerRadius(20)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height - UIScreen.main.bounds.height / 2.3 )
                
                VStack {
                    HStack {
                        Text("Location")
                            .foregroundStyle(.white)
                            
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                    }.padding(.bottom,1)
                    
                    HStack {
                        Image(systemName: "location.fill")
                            .imageScale(.large)
                        
                        Text("20 W 34th St, Giza, Haram 12556")
                        Spacer()
                    }.foregroundStyle(.gray)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Summon")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                            
                            Text("Press and hold controls to move the vehicle")
                                .font(.headline)
                                .fontWeight(.light)
                                .foregroundStyle(.white)
                        }
                    
                        Spacer()
                    }.padding(.vertical,15)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {}, label: {
                                Text("Go to Target")
                                    .bold()
                                    .foregroundStyle(.white)
                                    .padding()
                                    
                            })
                            Spacer()
                        }.background(Color(red: 0.15, green: 0.15, blue: 0.15))
                            .cornerRadius(15)
                        
                        
                        HStack {
                            HStack {
                                Spacer()
                                Button(action: {}, label: {
                                    HStack(spacing: -5) {
                                        Image(systemName: "arrow.up")
                                        Text("Forward")
                                            .bold()
                                            .foregroundStyle(.white)
                                            .padding()
                                    }.foregroundStyle(.white)
                                })
                                Spacer()
                            }
                            .background(Color(red: 0.15, green: 0.15, blue: 0.15)).cornerRadius(15)
                            
                            Spacer()
                            
                            HStack {
                                Spacer()
                                Button(action: {}, label: {
                                    HStack(spacing: -5) {
                                        Image(systemName: "arrow.down")
                                        Text("Backward")
                                            .bold()
                                            .foregroundStyle(.white)
                                            .padding()
                                    }.foregroundStyle(.white)
                                    
                                        
                                })
                                Spacer()
                            }.background(Color(red: 0.15, green: 0.15, blue: 0.15)).cornerRadius(15)
                            
                            
                        }.padding(.top,3)
                    }
                    
                }.padding()
                
                
                Spacer()
                
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
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        // Update the view here if needed
    }
}
