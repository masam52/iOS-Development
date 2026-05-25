//
//  WeatherView.swift
//  NewsApp
//
//  Created by Matej Samaržija on 25.05.2026..
//


import SwiftUI

struct WeatherView: View {
    @State private var isSunny = true
    @State private var sunGlow = 1.0
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isSunny ? Color.blue : Color.gray.opacity(0.7))
                .ignoresSafeArea()
                .zIndex(0)
                .animation(.easeInOut(duration: 1).delay(0.5), value: isSunny)
            
            if !isSunny {
                Group {
                    Image(systemName: "cloud.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .offset(x: -60, y: -80)
                    
                    Image(systemName: "cloud.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .foregroundColor(.white.opacity(0.8))
                        .shadow(radius: 5)
                        .offset(x: -80, y: -20)
                }
                .zIndex(1)
                .transition(
                    .move(edge: .leading)
                    .combined(with: .opacity)
                )
            }
            
            ZStack {
                Circle()
                    .fill(Color.yellow.opacity(isSunny ? 0.5 : 0.2))
                    .frame(width: 200, height: 200)
                    .blur(radius: 30)
                    .scaleEffect(sunGlow)
                    .animation(
                        .easeInOut(duration: 1),
                        value: isSunny
                    )
                    .animation(
                        .spring(duration: 1.5)
                        .repeatForever(autoreverses: true),
                        value: sunGlow
                    )
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 120, height: 120)
                    .shadow(radius: 10)
            }
            .zIndex(2)
            
            if !isSunny {
                Group {
                    Image(systemName: "cloud.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .offset(x: 70, y: 60)
                    
                    Image(systemName: "cloud.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .foregroundColor(.white.opacity(0.8))
                        .shadow(radius: 5)
                        .offset(x: 90, y: 10)
                }
                .zIndex(3)
                .transition(
                    .move(edge: .trailing)
                    .combined(with: .opacity)
                )
            }
            
            VStack(spacing: 8) {
                Text("Zagreb")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                Text(isSunny ? "24°" : "18°")
                    .font(.system(size: 60, weight: .thin))
                    .foregroundColor(.white)
                    .contentTransition(.numericText())
                    .animation(.easeInOut(duration: 0.5), value: isSunny)
                
                
            }
            .zIndex(4)
            .offset(y: +220)
            
            
            .zIndex(5)
        }
        .onAppear {
            sunGlow = 1.4
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 1)) {
                isSunny.toggle()
            }
        }
    }
}
