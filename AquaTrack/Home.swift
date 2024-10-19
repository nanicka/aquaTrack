//
//  ContentView.swift
//  AquaTrack
//
//  Created by Turma01-19 on 09/10/24.
//

import SwiftUI

enum Appconstants {
    static let H: CGFloat = 120.0
    static let W: CGFloat = 150.0
}

struct Home: View {
    var body: some View {
        NavigationStack{
            NavigationView{
                ZStack{
                    VStack{
                        HStack{
                            Text("Bem vindo!")
                                .font(Font.custom("Nunito", size: 35))
                                .fontWeight(.regular)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                                .offset(x: -20, y: -30)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .frame(height: 150)
                            
                            Image(.logohome)
                                .resizable()
                                .offset(x: 30, y: -30)
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                        }
                        Spacer()
                        HStack{
                            NavigationLink(destination: Tabaquario()
                                ){
                                    Aquario()
                                }
                            Spacer()
                                .frame(width: 15)
                            
                            NavigationLink(destination: Tabrio()){
                                Rio()
                            }
                        }
                        Spacer()
                            .frame(height: 20)
                        HStack{
                            
                            NavigationLink(destination: Tabmar()){
                                Mar()
                            }
                            
                            NavigationLink(destination: Tabpiscina()){
                                Spacer()
                                    .frame(width:15)
                                Piscina()
                            }
                        }
                        Spacer()
                            .frame(height: 20)
                        Outros()
                        Spacer()
                            .frame(height: 20)
                        
                        
                        
                    }
                   .padding(.bottom, 50)
                }
                .frame(width:400)
                .background(Color(.fundo))
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AquarioDetailView: View {
    var body: some View {
        VStack {
            Text("Detalhes do Aquário")
                .font(.largeTitle)
                .padding()
            // Adicione mais conteúdo conforme necessário
        }
        .navigationTitle("Aquário")
    }
}

#Preview {
    Home()
}



struct Aquario: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: Appconstants.W, height: Appconstants.H)
                .cornerRadius(10.0)
                .shadow(color: .black.opacity(0.25),radius: 4)
            VStack{
                Image(systemName: "fish")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                Text("Aquário")
                    .font(Font.custom("nunito", size: 20))
                    .foregroundColor(.black)
                    
            }
            
        }
    }
}

struct Rio: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: Appconstants.W, height: Appconstants.H)
                .cornerRadius(10.0)
                .shadow(color: .black.opacity(0.25),radius: 4)
            VStack{
                Image(.rio)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text("Rio")
                    .font(Font.custom("nunito", size: 20))
                    .foregroundColor(.black)
            }
            
        }
    }
}

struct Mar: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: Appconstants.W, height: Appconstants.H)
                .cornerRadius(10.0)
                .shadow(color: .black.opacity(0.25),radius: 4)
            VStack{
                Image(systemName: "water.waves")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                Text("Mar")
                    .font(Font.custom("nunito", size: 20))
                    .foregroundColor(.black)
            }
            
        }
    }
}

struct Piscina: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: Appconstants.W, height: Appconstants.H)
                .cornerRadius(10.0)
                .shadow(color: .black.opacity(0.25),radius: 4)
            VStack{
                Image(systemName: "figure.pool.swim")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                Text("Piscina")
                    .font(Font.custom("nunito", size: 20))
                    .foregroundColor(.black)
            }
            
        }
    }
}

struct Outros: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 315.0, height: Appconstants.H)
                .cornerRadius(10.0)
                .shadow(color: .black.opacity(0.25),radius: 4)
            VStack{
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                Text("Outros")
                    .font(Font.custom("nunito", size: 20))
            }
            
        }
    }
}
                      
