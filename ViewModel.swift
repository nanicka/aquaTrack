//
//  ModelView.swift
//  AquaTrack
//
//  Created by Turma01-23 on 14/10/24.
//

import Foundation

// https://medium.com/@amangupta007/swift-ios-mvvm-design-pattern-implementation-in-swift-using-api-manager-and-token-refresh-8a1d0b607599

let url = URL(string: "http://10.87.154.241:1880/testeget")!
let urlPost = URL(string: "http://10.87.154.241:1880/testepost")!

var request = URLRequest(url: url)
var requestPost = URLRequest(url: urlPost)


class ViewModel : ObservableObject {
    func fetch() {

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        let task = URLSession.shared.dataTask(with: url) { dados, resposta, erro in
            if let dados = dados {
                if let valores = try? JSONDecoder().decode([Pacote].self, from: dados) {
                    print(valores)
                } else {
                    print("Resposta inválida")
                }
            } else if let erro = erro {
                print("Pedido HTTP Falhou \(erro)")
            }
        }
        
        task.resume()
        
    }
    
    func post() {
        
        requestPost.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
            
        requestPost.httpMethod = "POST"
        
        let mensagem = Mensagem(pacote: 1)
        
        let dados = try! JSONEncoder().encode(mensagem)
        
        requestPost.httpBody = dados
        
        let task = URLSession.shared.dataTask(with: requestPost) { dados, resposta, erro in
            let statusCode = (resposta as! HTTPURLResponse).statusCode
            
            if statusCode == 200 {
                print("Sucesso")
            } else {
                print("Falha")
            }
            
        }
        
    }
    
    
    
}
