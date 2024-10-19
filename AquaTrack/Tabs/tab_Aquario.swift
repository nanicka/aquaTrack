//
//  Tabaquario.swift
//  AquaTrack0.3
//
//  Created by Turma01-8 on 16/10/24.
//

import SwiftUI

struct Tabaquario: View {
    var body: some View {
        VStack{
            TabView{
                Aquariohoje()
                    .tabItem {
                        Label( "", systemImage: "rectangle.3.group.fill")
                    }

                Aquariosemana()
                    .tabItem {
                        Label( "", systemImage: "chart.bar.xaxis")
                    }
                
                Aquariomes()
                    .tabItem {
                        Label( "", systemImage: "calendar")
                    }
            }
            
        }
    }
}

#Preview {
    Tabaquario()
}
