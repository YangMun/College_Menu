//
//  MainSelectView.swift
//  Yeonsung
//
//  Created by 양문경 on 5/17/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainSelectView: View {
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("backImg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                Color.black.opacity(0.3) // 반투명 검정 오버레이 추가
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Rectangle() // Add a rectangle for the menu board effect
                        .fill(Color.white.opacity(0.5))
                        .frame(maxWidth: 300, maxHeight: 450) // Adjust the width as needed
                        .cornerRadius(10)
                        .padding([.leading, .trailing], 20) // Padding left and right
                        .padding(.top, 10) // Padding top
                        .shadow(radius: 10)
                        .overlay(
                            VStack(spacing: 20) { // VStack to contain the Text and NavigationLinks
                                Text("연성대학교\n  식당메뉴")
                                    .font(Font.custom("Jalnan2TTF", size: 40, relativeTo: .largeTitle))
                                    .foregroundColor(Color.white)
                                    .padding([.top, .bottom], 40)
                                    .shadow(radius: 10.0, x: 20, y: 10)
                                
                                VStack{
                                    Spacer()
                                    NavigationLink(destination: ContentView()) {
                                        Text("⚪️     푸드코트   ⚪️")
                                            .font(Font.custom("Jalnan2TTF", size: 20, relativeTo: .largeTitle))
                                            .padding()
                                            .background(Color.white) // 갈색 계열
                                            .foregroundColor(.black)
                                            .cornerRadius(10)
                                            .frame(maxWidth: 300)
                                            
                                    }
                                    Spacer()
                                    NavigationLink(destination: TeacherMenuView()) {
                                        Text("⚪️  교직원 식당  ⚪️")
                                            .font(Font.custom("Jalnan2TTF", size: 20, relativeTo: .largeTitle))
                                            .padding()
                                            .background(Color.white) // 청록색
                                            .foregroundColor(.black)
                                            .cornerRadius(10)
                                    }
                                    Spacer()
                                }
                                
                               
                            }
                                .padding(.vertical)
                        )
                    Spacer()
                    AdBannerView(adUnitID: "ca-app-pub-1879498775996832/5337331742")
                        .frame(height: 50)
                }
                Spacer()
                
            }
        }
    }
}

#Preview {
    MainSelectView()
}
