//
//  ContentView.swift
//  DHT11-Weather
//
//  Created by Nischay's Mac on 14/04/23.
//

import SwiftUI
struct ContentView: View {
    init() {
           // Change navigation bar appearance
           let customColor = Color(red: 0.514, green: 0.714, blue: 0.561)
           let appearance = UINavigationBarAppearance()
           appearance.configureWithOpaqueBackground()
           appearance.backgroundColor = UIColor(customColor)
           appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Helvetica-Bold", size: 40)!]
           appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
           UINavigationBar.appearance().standardAppearance = appearance
           UINavigationBar.appearance().scrollEdgeAppearance = appearance
       }
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(spacing: 0) {
                    VStack {
                        Text("SWEETG GARLIC")
                            .font(.largeTitle)
                            .padding(.bottom, 40)
                    }
                    .frame(maxWidth: .infinity)
                    
                    CircularProgressView()
                        .padding(.vertical, 50)
                    
                    ImageSlider()
                        .tabViewStyle(PageTabViewStyle())
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.6)
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                }
                .navigationBarTitle("SWEETG GARLIC", displayMode: .large)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
       
    }

}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
