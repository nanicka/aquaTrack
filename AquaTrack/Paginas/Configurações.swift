//
//  config.swift
//  AquaTrack
//
//  Created by Turma01-22 on 10/10/24.
//

import SwiftUI

struct config: View {
    
    @StateObject private var darkmode = darkMode()
    @StateObject private var languageSettings = LanguageSettings()
    
    var body: some View {
        
        NavigationStack{
        
        ZStack{
            
            Rectangle()
                .fill(Color(darkmode.isDarkMode ? .darkBackground : .background))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack{
                
                Text("Configurações")
                    .font(.system(size: 35))
                    .foregroundStyle(darkmode.isDarkMode ? .background: .darkBackground)
                    .padding()
                
                
                ZStack{
                    Rectangle()
                        .fill(Color(darkmode.isDarkMode ? .listDark: .white))
                        .frame(width: 350, height: 50)
                        .cornerRadius(20)
                        .shadow(radius: 2)
                    
                    HStack{
                        Toggle("Modo Escuro", isOn: $darkmode.isDarkMode)
                            .padding()
                            .toggleStyle(SwitchToggleStyle(tint: .blue))
                            .font(.headline)
                            .foregroundColor(darkmode.isDarkMode ? .white : .black)
                            .padding()
             
                    }
                    
                }
                
                ZStack{
                    Rectangle()
                        .fill(Color(darkmode.isDarkMode ? .listDark: .white))
                        .frame(width: 350, height: 50)
                        .cornerRadius(20)
                        .shadow(radius: 2)
                    
                    HStack{
                       
                        Menu {
                            ForEach(languageSettings.languages, id: \.self) {
                                language in Button(action: {languageSettings.selectedLanguage = language})
                                {
                                    Text(language)
                                }
                                           }
                            } label: {
                                Text("Idioma")
                                .font(.headline)
                                .foregroundColor(darkmode.isDarkMode ? .white : .black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 30)
//                                .background(Color.gray.opacity(0.2))
//                                .cornerRadius(8)
                                       }
                        
                        Text(" \(languageSettings.selectedLanguage)")
                            .foregroundColor(darkmode.isDarkMode ? .white : .black)
                            .padding(.trailing, 30)
                    }
                    
                    

                    }
            }.padding(.bottom,400)
        }
            
        }
        
    }
}

#Preview {
    config()
}
