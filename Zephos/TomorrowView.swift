//
//  TomorrowView.swift
//  Zephos
//
//  Created by Charles Watson on 14/7/2022.
//

import SwiftUI

struct TomorrowView: View {
    var body: some View {
        VStack{
            Text("Tomorrows forecast")
                .font(.headline)
//                .padding()
            List{
                Text("1am")
                Text("3am")
                Text("6am")
                Text("9am")
                Text("12pm")
                Text("3pm")
                Text("6pm")
                Text("9pm")
            }
        }
    }
}

struct TomorrowView_Previews: PreviewProvider {
    static var previews: some View {
        TomorrowView()
    }
}
