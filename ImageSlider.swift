//
//  ImageSlider.swift
//  DHT11-Weather
//
//  Created by Nischay's Mac on 15/05/23.
//

import SwiftUI

struct ImageSlider: View {
    private let images = ["1", "2", "3"]
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var selection = 0
    
    var body: some View {
            GeometryReader { geometry in
                TabView(selection: $selection) {
                    ForEach(0..<3) { i in
                        Image("\(images[i])")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .cornerRadius(50)
                            .shadow(color: .black, radius: 5)
                            .onReceive(timer, perform: { _ in
                                withAnimation {
                                    selection = selection < 3 ? selection + 1 : 0
                                }
                            })
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            .edgesIgnoringSafeArea(.all)
        }
    }

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider()

    }
}
