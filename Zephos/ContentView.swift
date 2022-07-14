//
//  ContentView.swift
//  Zephos
//
//  Created by Charles Watson on 14/7/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tomorrowView = false
    var body: some View {
        VStack{
            
            Image(systemName: "wind")
            Text("Welcome to Zephos")
                .padding()
            TodayView().padding()
            
            Button(action: {
                tomorrowView.toggle()
            }) {
                HStack{
                    Text("Tomorrows forecast")
                }
            }
        }
        .popover(isPresented: $tomorrowView) {
            TomorrowView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
