//
//  ContentView.swift
//  WeatherApp
//
//  Created by Randy Kwalar on 25/04/2024.
//

import SwiftUI

struct WeatherDay: Identifiable {
    var id: Int
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
}

struct ContentView: View {
    var weatherDays: [WeatherDay] = [
        WeatherDay(
            id: 0, 
            dayOfWeek: "TUE",
            imageName: "cloud.sun.fill", 
            temperature: 74
        ),
        WeatherDay(
            id: 1, 
            dayOfWeek: "WED",
            imageName: "sun.max.fill",
            temperature: 70
        ),
        WeatherDay(
            id: 2,
            dayOfWeek: "THU",
            imageName: "wind",
            temperature: 66
        ),
        WeatherDay(
            id: 3,
            dayOfWeek: "FRI",
            imageName: "sunset.fill",
            temperature: 60
        ),
        WeatherDay(
            id: 4, 
            dayOfWeek: "SAT",
            imageName: "snowflake",
            temperature: 25
        ),
    ];
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(
                    weatherDay: WeatherDay(id: 0,
                                           dayOfWeek: "MON",
                                           imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                           temperature: 76)
                )
                HStack(spacing: 25) {
                    ForEach(weatherDays) { weatherDay in
                        WeatherDayView(weatherDay: weatherDay)
                    }
                }
                Spacer()
                Button {
                    isNight = !isNight
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  backgroundColor: isNight ? .white.opacity(0.2) : .white,
                                  foregroundColor: isNight ? .blue : .blue)
                }
                Spacer()
            }
        }
    }
}
    
#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var weatherDay: WeatherDay
    
    var body: some View {
        VStack {
            Text(weatherDay.dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: weatherDay.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(weatherDay.temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors:[isNight ? .black : .blue,
//                                               isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .bold, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var weatherDay: WeatherDay
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: weatherDay.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(weatherDay.temperature)°")
                .font(.system(size: 70, weight: .bold))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

