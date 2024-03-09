//
//  UpgradesView.swift
//  Mercedes
//
//  Created by Youssef Mohamed on 06/03/2024.
//

import SwiftUI

struct UpgradesView: View 
{
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color(red: 0.1, green: 0.1, blue: 0.1).ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(20)
                        .foregroundStyle(.white)
                        
                        Spacer()
                    
                    Image("merL")
                        .resizable()
                        .frame(width: 60, height: 60)
                    
                    Spacer()
                    
                    Image(systemName: "calendar.badge.plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(20)
                        .foregroundStyle(.white)
                }.padding(.top)
                ScrollView(.vertical) {
                    
                    Image("side")
                        .resizable()
                        .scaledToFit()
                        .padding(.top,40)
                    
                    HStack {
                        Text("VISION AVTR")
                            .font(.title)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }.padding(.top,40).padding(.leading)
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            Spacer()
                            SquareCard(icon: "brakesignal", title: "48 KM").padding(.trailing,8)
                            SquareCard(icon: "engine.combustion.fill", title: "3.8 Turbo").padding(.trailing,8)
                            SquareCard(icon: "ev.charger.fill", title: "Electric")
                            Spacer()
                        }.padding(.horizontal,7)
                            
                    }.scrollIndicators(.never)
                    
                    HStack {
                        Text("Car Status")
                            .font(.title)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                        Spacer()
                    }.padding(.top,10).padding()
                    
                    VStack {
                        HStack {
                            Text("For the next maintenance:")
                            Spacer()
                            Text("7495 KM")
                                .bold()
                        }.foregroundStyle(.white)
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width - 50,height: 8)
                                .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.3)).cornerRadius(20)
                            
                            Rectangle()
                                .frame(width: UIScreen.main.bounds.width - 150,height: 8)
                                .foregroundStyle(.white).cornerRadius(20)
                        }
                        
                        VStack {
                            HStack {
                                Text("Last service:")
                                    .foregroundStyle(.white)
                                
                                Text("16 / 02 / 2024")
                                    .bold()
                                    .foregroundStyle(.white)
                                Spacer()
                            }
                            
                        }.padding(.top)
                        
                    }.padding().background(Color(red: 0.15, green: 0.15, blue: 0.15)).cornerRadius(20).padding(.horizontal).padding(.top,-10)
                }
                
                
                Spacer()
            }
            
            
            
        }.edgesIgnoringSafeArea(.bottom ).navigationBarBackButtonHidden(true)
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

#Preview {
    UpgradesView()
}
