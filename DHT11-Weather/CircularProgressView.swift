//
//  CircularProgressView.swift
//  DHT11-Weather
//
//  Created by Nischay's Mac on 13/05/23.
//

import SwiftUI

struct CircularProgressView: View {
    @State public var temperature: String = "NULL"
    @State public var humidity: String = "NULL"
    var color: Color = Color("LaunchScreenColor")
    
    
    var body: some View {
        HStack {
            VStack {
                RoundProgressView(progress: CGFloat(Double(temperature) ?? 0), unit: "°C")
                    .frame(width: 120, height: 120)
                    .padding()
                Text("Temperature: \(temperature) °C").font(.footnote).foregroundColor(color).fontWeight(.bold).shadow(color: .green ,radius: 5)
                
            }
            .padding()
            
            VStack{
                
                RoundProgressView(progress: CGFloat(Double(humidity) ?? 0), unit: "%")
                    .frame(width: 120, height: 120)
                    .padding()
                Text("Humidity: \(humidity)%").font(.footnote).foregroundColor(color).fontWeight(.bold).shadow(color: .green ,radius: 5)
            }
            .padding()

        }
        .onAppear {
            fetchData()
            startTimer()
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://testingjunction.tech/SWEETG/IOS-Api/api1/create.php") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dict = json as? [String: Any] {
                        if let temp = dict["temperature"] as? String {
                            DispatchQueue.main.async {
                                self.temperature = temp
                            }
                        }
                        if let hum = dict["humidity"] as? String {
                            DispatchQueue.main.async {
                                self.humidity = hum
                            }
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func startTimer() {
            _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                fetchData()
            }
        }
    
    
}



struct RoundProgressView: View {
    var progress: CGFloat
    var unit: String
    var color: Color = Color("LaunchScreenColor")
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 20)
                .opacity(0.20)
            Circle()
                .trim(from: 0, to: progress / 100)
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: -90))
            Text("\(Int(progress))\(unit)") // Show progress value
                            .font(.largeTitle)
                            .fontWeight(.bold).foregroundColor(color)
        }
    }
}
struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
