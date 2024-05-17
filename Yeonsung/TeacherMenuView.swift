//
//  TeacherMenuView.swift
//  Yeonsung
//
//  Created by 양문경 on 5/16/24.
//

import SwiftUI
import GoogleMobileAds

struct TeacherMenuView: View {
    
    let CategorytArray = teacherFetchTableCategory()
    let TableMenu = teacherMenuInformation()
    
    var body: some View {
        VStack {
            HStack {
                Text(currentDateFormatted())
                    .font(.custom("Helvetica Neue", size: 18))
                    .padding(.leading) // 원하는 글꼴과 크기로 변경
            }

            TabView {
                ForEach(0..<CategorytArray.count, id: \.self) { index in
                    VStack {
                        Text(CategorytArray[index])
                            .font(.title)
                        Form {
                            List {
                                ForEach(TableMenu[index], id: \.self) { menuItem in
                                    HStack {
                                        Text(menuItem)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // 페이지 스타일로 변경
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // 페이지 인덱스 스타일 설정
        }
        AdBannerView(adUnitID: "ca-app-pub-1879498775996832/5337331742")
            .frame(height: 50)
    }
}

#Preview {
    TeacherMenuView()
}

