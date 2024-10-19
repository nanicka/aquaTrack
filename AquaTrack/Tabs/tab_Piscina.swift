//
//  Tabpiscina.swift
//  AquaTrack0.4.3
//
//  Created by Turma01-17 on 17/10/24.
//

import SwiftUI

struct Tabpiscina: View {
    var body: some View {
        VStack{
            TabView{
                piscinahoje()
                    .tabItem {
                        Label( "", systemImage: "rectangle.3.group.fill")
                    }
                
                piscinasemana()
                    .tabItem {
                        Label( "", systemImage: "chart.bar.xaxis")
                    }
                
                piscinames()
                    .tabItem {
                        Label( "", systemImage: "calendar")
                    }
            }
            
        }
    }
}

#Preview {
    Tabpiscina()
}
