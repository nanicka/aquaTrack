//
//  ModelView.swift
//  AquaTrack
//
//  Created by Turma01-23 on 14/10/24.
//

import Foundation

// https://medium.com/@amangupta007/swift-ios-mvvm-design-pattern-implementation-in-swift-using-api-manager-and-token-refresh-8a1d0b607599

let url = URL(string: "http://10.87.154.241:1880/aquaget")!
let urlPost = URL(string: "http://10.87.154.241:1880/aquapost")!

var request = URLRequest(url: url)
var requestPost = URLRequest(url: urlPost)

class ViewModel : ObservableObject {
    
    @Published var values : [Pacote] = []
    @Published var nitrato : Float?
    @Published var nitrito : Float?
    @Published var ph : Int?
    @Published var oxigenio : Float?
    @Published var temperatura : Float?
    @Published var amonia : Float?
    
    func atualizarValores() {
        if (values.count > 0) {
            nitrato = values.first?.valores.nitrato
            nitrito = values.first?.valores.nitrito
            ph = values.first?.valores.ph
            oxigenio = values.first?.valores.oxigenio
            temperatura = values.first?.valores.temperatura
            amonia = values.first?.valores.amonia
        }
    }
    
    
    func fetch() {
        
        /*
         fodase isso nao funciona
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        let task = URLSession.shared.dataTask(with: url) { dados, resposta, erro in
            if let dados = dados {
                if let self.values = try? JSONDecoder().decode([Pacote].self, from: dados) {
                    print(self.values)
                } else {
                    print("Resposta inválida")
                }
            } else if let erro = erro {
                print("Pedido HTTP Falhou \(erro)")
            }
        }
        
        task.resume()
         */


        let task = URLSession.shared.dataTask(with: url){data, _, error in
            do {
                self.values = try JSONDecoder().decode([Pacote].self, from: data!)
                
                self.values = self.values.sorted{
                   Int($0._id)! > Int($1._id)!
                }
                
                print(self.values)
                
                
                self.atualizarValores()
                
            } catch {
                print(error)
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
        
        let mensagem = Mensagem(pacote: "1")
        
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
        task.resume()
        
    }
    func desligar() {
        
        requestPost.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
            
        requestPost.httpMethod = "POST"
        
        let mensagem = Mensagem(pacote: "desligar")
        
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
        task.resume()
        
    }
    
    
    
}
