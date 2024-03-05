//
//  ContentView.swift
//  WebCrolling
//
//  Created by 양문경 on 2/13/24.
//

import SwiftUI
import SwiftSoup

struct ContentView: View {
    let CategorytArray = fetchTableCategory()
    let TableMenu = menuInformation()
    
    var body: some View {
        VStack{
            Text(currentDateFormatted())
                .font(.custom("Helvetica Neue", size: 18)) // 원하는 글꼴과 크기로 변경
        }
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<CategorytArray.count, id: \.self) { category in
                    VStack {
                        Text(CategorytArray[category])
                        Form {
                            List {
                                ForEach(TableMenu[category], id: \.self) { menuItem in
                                    HStack {
                                        Text(menuItem)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width) // 각 페이지의 너비를 화면 너비로 설정
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


