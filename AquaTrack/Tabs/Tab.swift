//
//  ContentView.swift
//  AquaTrack
//
//  Created by Turma01-22 on 09/10/24.
//

import SwiftUI

struct Tab: View {
    var body: some View {
        VStack{
            TabView{
                Home()
                    .tabItem {
                        Label( "", systemImage:
                                "rectangle.grid.2x2.fill")
                    }

                ContentView()
                    .tabItem {
                        Label( "", systemImage: "house.fill")
                    }
                
                config()
                    .tabItem {
                        Label( "", systemImage: "gearshape")
                    }
                
            }
            
        }
    }
}
        
#Preview {
    Tab()
}
