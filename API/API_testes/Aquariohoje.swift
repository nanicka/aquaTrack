//
//  Aquariohoje.swift
//  AquaTrack
//
//  Created by Turma01-8 on 15/10/24.
//

import SwiftUI

struct Aquariohoje: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.fundo
                    .ignoresSafeArea()
                VStack{
                    Text("Aquário").fontWeight(.light)
                        .font(.system(size:38))
                        .foregroundColor(Color.black)
                    
                    VStack{
                        HStack{
                            NavigationLink(destination: Aquariohoje()){
                                Text("HOJE")
                                    .foregroundColor(.white)
                                    .frame(width: 80, height: 40)
                                    .background(Color(.menu))
                                    .cornerRadius(23)
                                Spacer()
                                    .frame(width: 45)
                            }
                            NavigationLink(destination: Aquariosemana()){
                                Text("SEMANA")
                            }
                            Spacer()
                                .frame(width:50)
                                .frame(width:50)
                            NavigationLink(destination: Aquariomes()){
                                Text("MÊS")
                            }
                            
                        }
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 340, height: 40)
                        .background(Color(.menuu))
                        .cornerRadius(23)
                        
                        HStack{
                            Text("Oxigênio")
                                .offset(x:0 , y:-50)
                                .foregroundColor(.black)
                                .frame(width: 140, height: 140)
                                .cornerRadius(20)
                                .background(Color(viewModel.nitrato != nil ? (viewModel.nitrato! < 8 || viewModel.nitrato! > 5 ? .green : .red) : .white))
                                .cornerRadius(20)
                                .overlay {
                                    if (viewModel.oxigenio != nil) {
                                        Text(String(format: "%.2f \nmg/L", viewModel.oxigenio!))
                                            .padding(.top, 15)
                                            .font(.system(size:28))
                                    }
                                    
                                }
                            
                            
                            
                            VStack{
                                Text("PH")
                                    .offset(x: -60, y: -10)
                                    .foregroundColor(.black)
                                    .frame(width: 170, height: 60)
                                    .cornerRadius(20)
                                    .background(Color(viewModel.nitrato != nil ? (viewModel.nitrato! < 10 || viewModel.nitrato! > 3 ? .green : .red) : .white))
                                    .cornerRadius(10)
                                    .padding(.bottom,3)
                                    .overlay {
                                        HStack {
                                            Spacer()
                                            if (viewModel.ph != nil) {
                                                Text(String(format: "%.0f", viewModel.ph!))
                                                    .padding(.top, 10)
                                                    .padding()
                                                    .font(.system(size:24))
                                            }
                                        }
                                    }
                                
                                
                                Text("Temp.")
                                    .offset(x: -50, y: -10)
                                    .foregroundColor(.black)
                                    .frame(width: 170, height: 60)
                                    .cornerRadius(20)
                                    .background(Color(viewModel.nitrato != nil ? (viewModel.nitrato! < 30 || viewModel.nitrato! > 15 ? .green : .red) : .white))
                                    .cornerRadius(10)
                                    .overlay {
                                        HStack {
                                            Spacer()
                                            if (viewModel.temperatura != nil) {
                                                Text(String(format: "%.2f C", viewModel.temperatura!))
                                                    .padding(.top, 10)
                                                    .padding()
                                                    .font(.system(size:24))
                                            }
                                        }
                                        
                                    }
                            }
                        }
                        Text("Amônia")
                            .offset(x: -110, y: -50)
                            .foregroundColor(.black)
                            .frame(width: 310, height: 140)
                            .cornerRadius(20)
                            .background(Color(viewModel.nitrato != nil ? (viewModel.nitrato! < 20 || viewModel.nitrato! > 5 ? .green : .red) : .white))
                            .cornerRadius(20)
                            .overlay {
                                if (viewModel.amonia != nil) {
                                    Text(String(format: "%.2f mg/L", viewModel.amonia!))
                                        .padding(.top, 15)
                                        .font(.system(size:38))
                                }
                                
                            }
                        HStack{
                            Text("Nitratos")
                                .offset(x:0 , y:-50 )
                                .foregroundColor(.black)
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                                .background(Color(viewModel.nitrato != nil ? (viewModel.nitrato! < 20 || viewModel.nitrato! > 5 ? .green : .red) : .white))
                                .cornerRadius(20)
                                .overlay {
                                    if (viewModel.nitrato != nil) {
                                        Text(String(format: "%.2f \nmg/L", viewModel.nitrato!))
                                            .padding(.top, 15)
                                            .font(.system(size:28))
                                    }
                                    
                                }
                            
                            Text("Nitritos")
                                .offset(x:0 , y:-50 )
                                .foregroundColor(.black)
                                .frame(width: 150, height: 150)
                                .cornerRadius(20)
                                .background(Color(viewModel.nitrato != nil ? (viewModel.nitrato! < 0.1 || viewModel.nitrato! > 0 ? .green : .red) : .white))
                                .cornerRadius(20)
                                .overlay {
                                    if (viewModel.nitrito != nil) {
                                        Text(String(format: "%.2f \nmg/L", viewModel.nitrito!))
                                            .padding(.top, 15)
                                            .font(.system(size:28))
                                    }
                                    
                                }
                            
                        }.padding(.top, 2.0)
                        
                        
                        
                    }
                    
                }.padding(.bottom, 50)
                
                
                
            }
            
        }.onAppear() {
            viewModel.fetch()
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true){ _ in
                viewModel.fetch()
            }
            
            
            
        }
        
    }
    
}
       

#Preview {
    Aquariohoje()
}
