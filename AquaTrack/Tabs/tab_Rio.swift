//
//  Tabrio.swift
//  AquaTrack0.4
//
//  Created by Turma01-17 on 17/10/24.
//

import SwiftUI

struct Tabrio: View {
    var body: some View {
        VStack{
            TabView{
                Riohoje()
                    .tabItem {
                        Label( "", systemImage: "rectangle.3.group.fill")
                    }
                
                Riosemana()
                    .tabItem {
                        Label( "", systemImage: "chart.bar.xaxis")
                    }
                
                Riomes()
                    .tabItem {
                        Label( "", systemImage: "calendar")
                    }
            }
            
        }
    }
}

#Preview {
    Tabrio()
}
