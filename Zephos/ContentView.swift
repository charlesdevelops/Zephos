//
//  ContentView.swift
//  Zephos
//
//  Created by Charles Watson on 14/7/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var AboutView = false
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: Response?
    
    var body: some View {
        VStack{
            
            if let location = locationManager.location {
                if let weather = weather {
                    TodayView(weather: weather)
                }
                else{
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch{
                               print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else{
                WelcomeView()
                    .environmentObject(locationManager)
                }
            }
            
//            Button(action: {
//                AboutView.toggle()
//            }) {
//                HStack{
//                    Text("About")
//                }
//            }
        }
//        .popover(isPresented: $AboutView) {
//            Zephos.AboutView()
//        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
