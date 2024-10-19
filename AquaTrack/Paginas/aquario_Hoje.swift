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
            ZStack{
                Color.fundo.ignoresSafeArea()
                VStack{
                    Text("Aquário")
                        .offset(x: 0, y: 16.5)
                        .fontWeight(.light)
                        .font(.system(size:38))
                        .foregroundColor(Color.black)
                    VStack{
                            Text("DADOS DE HOJE")
                                .bold()
                                .font(.title3)
                                .foregroundColor(.white)
                                .frame(width: 370, height: 40)
                                .background(Color(.menu))
                                .cornerRadius(23)
                                .padding(.bottom,21)
                     
                        Spacer()
                            .frame(width: 1, height: 0)
                        HStack{
                            Text("Oxigênio")
                                .offset(x:0 , y:-50)
                                .foregroundColor(.black)
                                .frame(width: 140, height: 160)
                                .cornerRadius(20)
                                .background(Color(viewModel.oxigenio != nil ? (viewModel.oxigenio! < 8 && viewModel.oxigenio! > 5 ? .green : .vermelho) : .white))
                                .cornerRadius(20)
                                .shadow(radius: 5)                                .overlay {
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
                                    .frame(width: 170, height: 70)
                                    .cornerRadius(20)
                                    .shadow(radius: 5)

                                    .background(
                                        Color(
                                            viewModel.ph != nil ? (
                                                viewModel.ph! < 10 && viewModel.ph! > 3 ? .green : .vermelho
                                            ) : .white))                                    .cornerRadius(10)
                                    .shadow(radius: 5)

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
                                    .frame(width: 170, height: 70)
                                    .cornerRadius(20)
                                    .background(Color(viewModel.temperatura != nil ? (viewModel.temperatura! < 30 && viewModel.temperatura! > 15 ? .green : .vermelho) : .white))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)


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
                            .background(Color(viewModel.amonia != nil ? (viewModel.amonia! < 20 && viewModel.amonia! > 5 ? .green : .vermelho) : .white))
                            .cornerRadius(20)
                            .shadow(radius: 5)
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
                                .background(Color(viewModel.nitrato != nil ? (viewModel.nitrato! < 20 && viewModel.nitrato! > 5 ? .green : .vermelho) : .white))
                                .cornerRadius(20)
                                .shadow(radius: 5)
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
                                .background(Color(viewModel.nitrito != nil ? (viewModel.nitrito! < 0.1 && viewModel.nitrito! > 0 ? .green : .vermelho) : .white))
                                .cornerRadius(20)
                                .shadow(radius: 5)
                                .overlay {
                                    if (viewModel.nitrito != nil) {
                                        Text(String(format: "%.2f \nmg/L", viewModel.nitrito!))
                                            .padding(.top, 15)
                                            .font(.system(size:28))
                                    }
                                    
                                }
                            
                        }.padding(.top, 2.0)
                        
                    }
                    
                    
                    
                }.padding(.bottom,80)
                
            }.onAppear() {
                viewModel.fetch()
                Timer.scheduledTimer(withTimeInterval: 15, repeats: true) {_ in
                    viewModel.fetch()
                }
            }

            
        }
            
            
            
        }
        
    
    
    
       

#Preview {
    Aquariohoje()
}
