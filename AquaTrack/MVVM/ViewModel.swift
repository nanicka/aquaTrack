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
    
    @Published var diasDaSemana: [String] = []

    @Published var values : [Pacote] = []
    @Published var nitrato : Float?
    @Published var nitrito : Float?
    @Published var ph : Float?
    @Published var oxigenio : Float?
    @Published var temperatura : Float?
    @Published var amonia : Float?
    
    struct MediaDiaria: Identifiable {
        var dia: String
        var media: Double
        var id = UUID()
    }
    
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
    
    func obterDiaDaSemana(id: String) -> String {
           guard let timestamp = TimeInterval(id) else {
               return "Desconhecido" // Retorna um valor padrão se a conversão falhar
           }

           let date = Date(timeIntervalSince1970: timestamp) // Converte o timestamp para Date
           let calendar = Calendar.current
           let weekday = calendar.component(.weekday, from: date) // Obtém o dia da semana (1 a 7)
           
           // Retorna o nome do dia da semana
           return calendar.weekdaySymbols[weekday - 1]
       }
    
    func calcularMediaPorDiaDaSemana() -> [MediaDiaria] {
        var medias: [String: [Double]] = [:] // Dicionário para armazenar os valores por dia da semana

        for pacote in values {
            let diaDaSemana = obterDiaDaSemana(id: pacote._id)
            let niveis = pacote.valores
            
            // Adiciona os valores ao dicionário
            if let nitrato = niveis.nitrato {
                medias[diaDaSemana, default: []].append(Double(nitrato))
            }
            if let nitrito = niveis.nitrito {
                medias[diaDaSemana, default: []].append(Double(nitrito))
            }
            if let ph = niveis.ph {
                medias[diaDaSemana, default: []].append(Double(ph))
            }
            if let oxigenio = niveis.oxigenio {
                medias[diaDaSemana, default: []].append(Double(oxigenio))
            }
            if let temperatura = niveis.temperatura {
                medias[diaDaSemana, default: []].append(Double(temperatura))
            }
            if let amonia = niveis.amonia {
                medias[diaDaSemana, default: []].append(Double(amonia))
            }
            // print(medias)
        }

        // Calcula a média para cada dia
        var resultado: [MediaDiaria] = []
        for (dia, valores) in medias {
            let media = valores.reduce(0, +) / Double(valores.count)
            resultado.append(MediaDiaria(dia: dia, media: media))
        }
        //print("Resultados: \(resultado)\n")
        return resultado
    }
    
    func fetch() {
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
