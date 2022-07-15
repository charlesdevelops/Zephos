//
//  TodayView.swift
//  Zephos
//
//  Created by Charles Watson on 14/7/2022.
//

import SwiftUI

struct TodayView: View {
    var weather: Response
    var body: some View {
            ZStack(alignment: .leading){
                VStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text(weather.name)
                            .bold().font(.title)
                        Text("Today, \(Date().formatted(.dateTime.day().month().hour().minute()))").fontWeight(.light)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    VStack{
                        HStack{
                            VStack(spacing: 20){
                                Image(systemName: "cloud.sun")
                                    .font(.system(size: 40))
                                Text(weather.weather[0].main)
                            }
                            .frame(width: 100, alignment: .leading)
                            
                            Spacer()
                            
                            Text(weather.main.feelsLike.roundDouble()+"°")
                                .font(.system(size: 75))
                                .padding()
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }.edgesIgnoringSafeArea(.bottom)
            .preferredColorScheme(.dark)
        }
    }

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView(weather: previewWeather)
    }
}
