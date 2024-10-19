import SwiftUI
import Charts


struct Valores2: Identifiable {
   
    var dia: String
    var media: Double
    var id = UUID()
}


var stackedBarData2: [String: [Valores]] = [
    "Oxigênio" : [
    .init(dia: "Seg", media: 4),
    .init(dia: "Ter", media: 7),
    .init(dia: "Qua", media: 7),
    .init(dia: "Qui", media: 7),
    .init(dia: "Sex", media: 6),
    .init(dia: "Sab", media: 4),
    .init(dia: "Dom", media: 1)
    ],
    "pH" : [
    .init(dia: "Seg", media: 8),
    .init(dia: "Ter", media: 4),
    .init(dia: "Qua", media: 8),
    .init(dia: "Qui", media: 1),
    .init(dia: "Sex", media: 6),
    .init(dia: "Sab", media: 4),
    .init(dia: "Dom", media: 2)
    ],
    "Temperatura" : [
    .init(dia: "Seg", media: 2),
    .init(dia: "Ter", media: 4),
    .init(dia: "Qua", media: 7),
    .init(dia: "Qui", media: 13),
    .init(dia: "Sex", media: 5),
    .init(dia: "Sab", media: 5),
    .init(dia: "Dom", media: 2)
    ],
    "Amônia" : [
    .init(dia: "Seg", media: 1),
    .init(dia: "Ter", media: 4),
    .init(dia: "Qua", media: 7),
    .init(dia: "Qui", media: 10),
    .init(dia: "Sex", media: 2),
    .init(dia: "Sab", media: 4),
    .init(dia: "Dom", media: 2)
    ],
    "Nitrato" : [
    .init(dia: "Seg", media: 4),
    .init(dia: "Ter", media: 8),
    .init(dia: "Qua", media: 7),
    .init(dia: "Qui", media: 9),
    .init(dia: "Sex", media: 5),
    .init(dia: "Sab", media: 4),
    .init(dia: "Dom", media: 2)
    ],
    "Nitrito" : [
    .init(dia: "Seg", media: 8),
    .init(dia: "Ter", media: 4),
    .init(dia: "Qua", media: 7),
    .init(dia: "Qui", media: 17),
    .init(dia: "Sex", media: 5),
    .init(dia: "Sab", media: 4),
    .init(dia: "Dom", media: 2)
    ]
]


struct Riosemana: View {
    
    @State private var selectedSensor: String = "Oxigênio"
    @State private var selectedButton: String? = nil
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.fundo)
                    .ignoresSafeArea()
                
                Rectangle()
                    .cornerRadius(10)
                    .frame(width: 300, height: 299)
                    .foregroundColor(.white)
                    .padding(.top, 215)
                    .shadow(radius: 5)
                
                
                VStack{
                    HStack{
                        Image("filter")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35)
                        
                        Spacer()
                            .frame(width: 300)
                        
                    }
                    
                    Spacer()
                        .frame(height: 365)
                }
                
                
                VStack{
                    Text("Rio")
                        .fontWeight(.light)
                            .font(.system(size:38))
                            .foregroundColor(Color.black)
                            
                    Spacer()
                        .frame(height: 600)
                }
                
                VStack{
                    Text("DADOS DA SEMANA")
                        .bold()
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(width: 370, height: 40)
                        .background(Color(.menu))
                        .cornerRadius(23)
                    Spacer()
                        .frame(height: 500)
                }
                
                VStack{
                    HStack{
                        Spacer()
                            .frame(width: 45)
                        
                        
                        Button("Oxigênio") {
                            selectedSensor = "Oxigênio"
                        }
                        .foregroundColor(.black)
                        .background(Color.white.frame(width: 135, height: 35).cornerRadius(20).shadow(radius: 2))
                        
                        Spacer()
                            .frame(width: 100)
                        
                        Button("pH") {
                            selectedSensor = "pH"
                        }
                        .foregroundColor(.black)
                        .background(Color.white.frame(width: 135, height: 35).cornerRadius(20).shadow(radius: 2))
                    }
                    
                    Spacer()
                        .frame(height: 25)
                    
                    HStack{
                        Spacer()
                            .frame(width: 45)
                        
                        
                        Button("Temperatura") {
                            selectedSensor = "Temperatura"
                        }
                        .foregroundColor(.black)
                        .background(Color.white.frame(width: 135, height: 35).cornerRadius(20).shadow(radius: 2))
                        
                        Spacer()
                            .frame(width: 68)
                        
                        Button("Amônia") {
                            selectedSensor = "Amônia"
                        }
                        .foregroundColor(.black)
                        .background(Color.white.frame(width: 135, height: 35).cornerRadius(20).shadow(radius: 2))
                    }
                    
                    Spacer()
                        .frame(height: 25)
                    
                    HStack{
                        Spacer()
                            .frame(width: 60)
                        
                        
                        Button("Nitrato") {
                            selectedSensor = "Nitrato"
                        }
                        .foregroundColor(.black)
                        .background(Color.white.frame(width: 135, height: 35).cornerRadius(20).shadow(radius: 2))
                        
                        Spacer()
                            .frame(width: 95)
                        
                        Button("Nitrito") {
                            selectedSensor = "Nitrito"
                        }
                        .foregroundColor(.black)
                        .background(Color.white.frame(width: 135, height: 35).cornerRadius(20).shadow(radius: 2))
                    }
                    Spacer()
                        .frame(height: 275)
                    
                }
                  
                VStack{
                    Spacer()
                        .frame(height: 235)
                    
                    HStack {
                        Chart {
                            ForEach(stackedBarData[selectedSensor] ?? []) { shape in
                                BarMark(
                                    x: .value("Dia semana", shape.dia),
                                    y: .value("Valor medio", shape.media)
                                )
                                .cornerRadius(9)
                                .foregroundStyle(LinearGradient(colors: [Color.green, Color.blue],      startPoint: .top, endPoint: .bottom))
                            }
                        }.aspectRatio(contentMode: .fit)
                        .frame(width: 270)
                        
                        /*
                        Chart {
                            ForEach(stackedBarData) { shape in
                                BarMark(
                                    x: .value("Dia semana", shape.dia),
                                    y: .value("Valor medio", shape.media)
                                )
                                .cornerRadius(9)
                                .foregroundStyle(
                                    LinearGradient(colors: [Color.blue, Color.mint],      startPoint: .top, endPoint: .bottom))
                                
                                
                            }
                        }
                         */
                        
                    }
                }
                
            }
        }.onAppear() {
            viewModel.fetch()
            Timer.scheduledTimer(withTimeInterval: 15, repeats: true) {_ in viewModel.fetch()}
        }
    }
}
#Preview {
    Riosemana()
}
