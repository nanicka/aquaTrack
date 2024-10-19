//
//  LanguageSettings.swift
//  AquaTrack
//
//  Created by Turma01-22 on 14/10/24.
//

import SwiftUI

class LanguageSettings: ObservableObject {
    @Published var selectedLanguage: String = "Português"
    
    let languages = ["Português", "Inglês", "Espanhol"]
}
