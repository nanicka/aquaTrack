//
//  Model.swift
//  AquaTrack
//
//  Created by Turma01-23 on 14/10/24.
//

import Foundation

struct Pacote : Decodable {
    let _id : String
    let valores : Niveis
}

struct Niveis : Decodable {
    let nitrato : Float?
    let nitrito : Float?
    let ph : Float?
    let oxigenio : Float?
    let temperatura : Float?
    let amonia : Float?
}

struct Mensagem : Encodable {
    let pacote : String?
}
