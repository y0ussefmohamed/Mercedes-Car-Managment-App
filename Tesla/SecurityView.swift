//
//  SecurityView.swift
//  Mercedes
//
//  Created by Youssef Mohamed on 06/03/2024.
//

import SwiftUI

struct SecurityView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.1, blue: 0.1).ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    VStack(alignment:.leading) {
                        Text("VISION AVTR")
                            .font(.title2)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text("Electric Car")
                            .foregroundStyle(.white)
                    }
                    
                    
                    
                    Spacer()
                }.padding(.horizontal)
                
                ScrollView(.vertical) {
                    Image("op")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical,30).padding(.top)
                    
                    VStack {
                        HStack {
                            SecurityCard(title: "Battery Level", content: "75%", icon: "battery.75", iconBackgroundColor:Color(red: 0.15, green: 0.15, blue: 0.15) )
                            SecurityCard(title: "AC", content: "20° C", icon: "wind", iconBackgroundColor: Color(red: 0.15, green: 0.15, blue: 0.15) )
                        }.padding(.top)
                        
                        HStack {
                            SecurityCard(title: "Seat Angle", content: "35°", icon: "carseat.right.fill", iconBackgroundColor:Color(red: 0.15, green: 0.15, blue: 0.15) )
                            SecurityCard(title: "Car Health", content: "100%", icon: "wrench.adjustable.fill", iconBackgroundColor:Color(red: 0.15, green: 0.15, blue: 0.15) )
                        }
                    }.padding(.horizontal,5)
                }.scrollIndicators(.never)
                
                Spacer()
            }
            
        }.navigationBarBackButtonHidden(true) // Hide the default back button
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

struct SecurityCard: View {
    var title: String
    var content: String
    var icon: String
    var iconBackgroundColor: Color
    var body: some View {
        VStack(alignment: .leading,spacing: 5) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white).padding(.horizontal)
            
            ZStack {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 50,height: 50)
                            .foregroundStyle(iconBackgroundColor)
                        
                        
                        if icon == "battery.75" {
                            Image(systemName: icon)
                                .imageScale(.large)
                                .foregroundStyle(.white)
                                .bold()
                        }else {
                            Image(systemName: icon)
                                .imageScale(.large)
                                .foregroundStyle(.white)
                                .bold()
                        }
                        
                    }
                    
                    Text(content)
                        .bold().padding(.leading,2)
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                
            }.padding(20).background(Color(red: 0.2, green: 0.2, blue: 0.2)).cornerRadius(30).padding(3)
        }.padding(.top)
        
    }
}

#Preview {
    SecurityView()
}
