import SwiftUI
import Charts

struct ValoresMes3: Identifiable {
   
    var dado: String
    var mediames: Double
    var semana: String
    var id = UUID()
    
    
    
    
    
    
    
}


var BarData3: [String : [ValoresMes]] = [
    "Oxigênio" : [
    .init(dado: "Oxi", mediames: 8, semana: "Sem 0"),
    .init(dado: "Oxi", mediames: 10, semana:"Sem 1"),
    .init(dado: "Oxi", mediames: 9, semana: "Sem 2"),
    .init(dado: "Oxi", mediames: 10, semana: "Sem 3"),
    .init(dado: "Oxi", mediames: 11, semana: "Sem 4")
    ],
    "Nitrato" : [
    .init(dado: "nitra", mediames: 5, semana: "Sem 0"),
    .init(dado: "", mediames: 19, semana:"Sem 1"),
    .init(dado: "Oxi", mediames: 15, semana: "Sem 2"),
    .init(dado: "Oxi", mediames: 13, semana: "Sem 3"),
    .init(dado: "Oxi", mediames: 17, semana: "Sem 4")
    ],
    "Nitrito" : [
    .init(dado: "Oxi", mediames: 10, semana: "Sem 0"),
    .init(dado: "Oxi", mediames: 7, semana:"Sem 1"),
    .init(dado: "Oxi", mediames: 5, semana: "Sem 2"),
    .init(dado: "Oxi", mediames: 13, semana: "Sem 3"),
    .init(dado: "Oxi", mediames: 10, semana: "Sem 4")
    ],
    "pH" : [
    .init(dado: "Oxi", mediames: 5, semana: "Sem 0"),
    .init(dado: "Oxi", mediames: 10, semana:"Sem 1"),
    .init(dado: "Oxi", mediames: 15, semana: "Sem 2"),
    .init(dado: "Oxi", mediames: 13, semana: "Sem 3"),
    .init(dado: "Oxi", mediames: 17, semana: "Sem 4")
    ],
    "Amônia" : [
    .init(dado: "Oxi", mediames: 4, semana: "Sem 0"),
    .init(dado: "Oxi", mediames: 16, semana:"Sem 1"),
    .init(dado: "Oxi", mediames: 18, semana: "Sem 2"),
    .init(dado: "Oxi", mediames: 8, semana: "Sem 3"),
    .init(dado: "Oxi", mediames: 7, semana: "Sem 4")
    ],
    "Temperatura" : [
    .init(dado: "Oxi", mediames: 5, semana: "Sem 0"),
    .init(dado: "Oxi", mediames: 10, semana:"Sem 1"),
    .init(dado: "Oxi", mediames: 15, semana: "Sem 2"),
    .init(dado: "Oxi", mediames: 13, semana: "Sem 3"),
    .init(dado: "Oxi", mediames: 17, semana: "Sem 4")
    ]
]








struct Marmes: View {
    
    @State private var selectedSensor: String = "Oxigênio"
    
    var body: some View {
        ZStack{
            
            Color(.fundo)
                .ignoresSafeArea()
            
            VStack{
                Text("Mar")
                    .offset(x: 0, y: -300)
                    .fontWeight(.light)
                    .font(.system(size:38))
                    .foregroundColor(Color.black)
            }
            
            VStack{
                Text("DADOS DO MÊS")
                    .bold()
                    .font(.title3)
                    .foregroundColor(.white)
                    .background(Color.menu.frame(width: 370, height: 40).cornerRadius(50))
                
                Spacer()
                    .frame(height: 500)
            }
            
            VStack{
                Spacer()
                    .frame(height: 299)
                
                Rectangle()
                    .foregroundColor(.white)
                    .aspectRatio(CGSize(width: 22, height: 14), contentMode: .fit)
                    .frame(width: 350)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            
            VStack{
                HStack{
                    Button("Oxigênio") {
                        selectedSensor = "Oxigênio"
                    }
                    .foregroundColor(.black)
                    .background(Color.white.frame(width: 130, height: 35).cornerRadius(20).shadow(radius: 2))
                    
                    Spacer()
                        .frame(width: 100)
                    
                    Button("pH") {
                        selectedSensor = "pH"
                    }
                    .foregroundColor(.black)
                    .background(Color.white.frame(width: 130, height: 35).cornerRadius(20).shadow(radius: 2))
                    
                    Spacer()
                        .frame(width: 21)
                    
                }
                
                Spacer()
                    .frame(height: 30)
                
                HStack{
                    Button("Temperatura") {
                        selectedSensor = "Temperatura"
                    }
                    .foregroundColor(.black)
                    .background(Color.white.frame(width: 130, height: 35).cornerRadius(20).shadow(radius: 2))
                    
                    Spacer()
                        .frame(width: 160)
                    
                    
                    Button("Amônia") {
                        selectedSensor = "Amônia"
                    }
                    .foregroundColor(.black)
                    .background(Color.white.frame(width: 130, height: 35).cornerRadius(20).shadow(radius: 2))
                    
                    Spacer()
                        .frame(width: 20)
                    
                }
                
                Spacer()
                    .frame(height: 30)
                
                HStack{
                    Button("Nitrato") {
                        selectedSensor = "Nitrato"
                    }
                    .foregroundColor(.black)
                    .background(Color.white.frame(width: 130, height: 35).cornerRadius(20).shadow(radius: 2))
                    
                    Spacer()
                        .frame(width: 96)
                    
                    Button("Nitrito") {
                        selectedSensor = "Nitrito"
                    }
                    .foregroundColor(.black)
                    .background(Color.white.frame(width: 130, height: 35).cornerRadius(20).shadow(radius: 2))
                }
                
                Spacer()
                    .frame(height: 250)
                
            }
            
            
            VStack{
                Image("logohome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    .offset(x:0, y:-130)
            }
            
            
            
            
            
            
            
            VStack {
                
                Spacer()
                    .frame(height: 300)
                
                HStack{
                    Chart{
                        ForEach(BarData[selectedSensor] ?? []) { media in
                            AreaMark(
                                x: .value("Semana", media.semana),
                                y: .value("mediames", media.mediames)
                            )
                            .interpolationMethod(.catmullRom)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color.mint.opacity(0.8), Color.blue.opacity(0.2)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                    )
                                )
                            }
                        }
                        .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fill)
                        .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
                        .frame(width: 350)
                    }
                .aspectRatio(CGSize(width: 16, height: 9), contentMode: .fit)
                .frame(width: 350)
                }
            
        }
    }
}

#Preview {
    Marmes()
}
