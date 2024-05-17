//
//  ContentView.swift
//  Yeonsung
//
//  Created by 양문경 on 5/14/24.
//

import SwiftUI
import SwiftSoup
import GoogleMobileAds

struct ContentView: View {
    let CategorytArray = fetchTableCategory()
    let TableMenu = menuInformation()
    
    var body: some View {
        VStack {
            Text(currentDateFormatted())
                .font(.custom("Helvetica Neue", size: 18))
            TabView {
                ForEach(0..<CategorytArray.count, id: \.self) { index in
                    VStack {
                        Text(CategorytArray[index])
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
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        }
        AdBannerView(adUnitID: "ca-app-pub-1879498775996832/5337331742")
            .frame(height: 50)
    }
}
#Preview {
    ContentView()
}

// UIViewRepresentable wrapper for AdMob banner view
struct AdBannerView: UIViewRepresentable {
    let adUnitID: String

    func makeUIView(context: Context) -> GADBannerView {
        let bannerView = GADBannerView(adSize: GADAdSizeFromCGSize(CGSize(width: 320, height: 50))) // Set your desired banner ad size
        bannerView.adUnitID = adUnitID
        bannerView.rootViewController = UIApplication.shared.windows.first?.rootViewController
        bannerView.load(GADRequest())
        return bannerView
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {}
}


