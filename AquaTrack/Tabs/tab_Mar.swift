//
//  Tabmar.swift
//  AquaTrack0.4.3
//
//  Created by Turma01-17 on 17/10/24.
//

import SwiftUI

struct Tabmar: View {
    var body: some View {
        VStack{
            TabView{
                Marhoje()
                    .tabItem {
                        Label( "", systemImage: "rectangle.3.group.fill")
                    }
                
                Marsemana()
                    .tabItem {
                        Label( "", systemImage: "chart.bar.xaxis")
                    }
                
                Marmes()
                    .tabItem {
                        Label( "", systemImage: "calendar")
                    }
            }
            
        }
    }
}

#Preview {
    Tabmar()
}
