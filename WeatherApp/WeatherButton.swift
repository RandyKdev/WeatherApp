//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Randy Kwalar on 29/04/2024.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(foregroundColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
        
    }
}

#Preview {
    WeatherButton(title: "Test", backgroundColor: .blue, foregroundColor: .white)
}
