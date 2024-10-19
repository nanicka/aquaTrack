//
//  ContentView.swift
//  AquaTrack
//
//  Created by Turma01-22 on 09/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var darkmode = darkMode()
    
    var body: some View {
        
        NavigationStack{
        ZStack{
            Rectangle()
                .fill(Color(darkmode.isDarkMode ? .darkBackground : .background))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .ignoresSafeArea()
                
            
            VStack {
                Image(.logo)
                    .resizable()
                    .frame(width: 250, height: 230)
                    .scaledToFit()
                    
                
                Spacer()
                
                ZStack{
                    
                    Image(.onda1)
                        .resizable()
                        .frame(width: 420, height: 310)
                    //                    .scaledToFit()
                        
                    NavigationLink(destination: Tab()
                        .navigationBarBackButtonHidden(true)){
                            Image(.botao)
                                .resizable()
                                .frame(width: 250, height: 70)
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
