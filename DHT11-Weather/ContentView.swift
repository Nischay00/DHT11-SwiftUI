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
        NavigationView {
            VStack{
                // Function call for Show progress view
                CircularProgressView().padding(.top,50).padding(.bottom,40)
                // Title of the app
                    .navigationBarTitle("SWEETG GARLIC" , displayMode: .large)
                // ImageView
                ImageSlider()
                    .tabViewStyle(PageTabViewStyle()).edgesIgnoringSafeArea(.all).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
        }
       .navigationViewStyle(StackNavigationViewStyle())
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
