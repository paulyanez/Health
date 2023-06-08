//
//  ContentView.swift
//  Health
//
//  Created by Paul Yanez on 6/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                Summary()
                    .tabItem {
                        Label("Summary", systemImage: "target")
                    }.tag(0)
                
                Summary()
                    .tabItem {
                        Label("Fitness+", systemImage: "figure.run.circle.fill")
                    }.tag(1)
                
                Summary()
                    .tabItem {
                        Label("Sharing", systemImage: "infinity.circle.fill")
                    }.tag(2)
                
            }
            .tint(Color.green)
        }
    }
}

struct Summary: View {
    @State var showRing: Bool = false
    var twoColumnGrid = [GridItem(.flexible(), spacing: 6), GridItem(.flexible(), spacing: 6)]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 15) {
                
                VStack(spacing: 20.0) {
                    activity
                    workouts
                    trends
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.bottom, 25)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    HStack(spacing: 0.0) {
                        Text("Summary")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        // action to perform when button is tapped
                    }) {
                        Image("photo2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 34, height: 34)
                            .clipShape(Circle())
                            .padding(2)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    }
                }
            }
        }
    }
    
    // Top Navigation
    var topNav: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("WEDNESDAY, JUN 7")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                Text("Summary")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Button(action: {
                // action to perform when button is tapped
            }) {
                Image("photo2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 34, height: 34)
                    .clipShape(Circle())
                    .padding(2)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 1)
                    )
            }
        }
        .padding(.top, 13)
    }
    
    // Activity
    var activity: some View {
        VStack(spacing: 6) {
            VStack {
                Text("Activity")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 4)
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 10.0) {
                    VStack(alignment: .leading) {
                        Text("Move")
                            .font(.body)
                            .foregroundColor(Color.white)
                        Text("228/330")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(Color.pink)
                        +
                        Text("CAL")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(Color.pink)
                    }
                    VStack(alignment: .leading) {
                        Text("Steps")
                            .font(.body)
                            .foregroundColor(Color.white)
                        Text("6,290")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.green)
                    }
                    VStack(alignment: .leading) {
                        Text("Distance")
                            .font(.body)
                            .foregroundColor(Color.white)
                        Text("3.7")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.teal)
                        +
                        Text("MIL")
                            .font(.body)
                            .fontWeight(.medium)
                            .foregroundColor(Color.teal)
                    }
                }
                
                Spacer()
                
                HStack {
                    ZStack {
                        ForEach(rings.indices, id: \.self) { index in
                            ZStack {
                                Circle()
                                    .stroke(rings[index].keyColor.opacity(0.16), lineWidth: 12)
                                Circle()
                                    .trim(from: 0, to: showRing ? rings[index].progress / 100 : 0)
                                    .stroke(rings[index].keyColor, style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                                    .rotationEffect(.init(degrees: -90))
                            }
                            .padding(CGFloat(index) * 13)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 20.4) {
                                    withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).delay(Double(index) * 0.1)) {
                                        showRing = true
                                    }
                                }
                            }
                            .onDisappear { showRing = false }
                        }
                    }
                    .frame(width: 130, height: 130)
                    .scaleEffect(x: 1.15, y: 1.15)
                    .offset(x: -12)
                }
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.ultraThinMaterial).opacity(0.5)
            }
        }
        .padding(.top, 14)
    }
    
    // Workouts
    var workouts: some View {
        VStack(spacing: 6.0) {
            HStack {
                Text("Workouts")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 4)
                
                Spacer()
                
                Text("Show More")
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundColor(Color.green)
            }

            HStack(alignment: .bottom, spacing: 12.0) {
                Image(systemName: "figure.run")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(.pink)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                
                VStack(alignment: .leading) {
                    Text("Outdoor Run")
                        .font(.title3)
                    
                    Text("682")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.pink)
                    +
                    Text("CAL")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.pink)
                }
                Spacer()
                
                HStack {
                    Text("Today")
                        .font(.callout)
                        .foregroundColor(Color.white)
                    
                    Image("arrow3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 7.0, height: 7.0)

                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.ultraThinMaterial).opacity(0.5)
            }
            
            HStack(alignment: .bottom, spacing: 12.0) {
                Image(systemName: "figure.walk")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                
                VStack(alignment: .leading) {
                    Text("Outdoor Walk")
                        .font(.title3)
                    
                    Text("214")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.green)
                    +
                    Text("CAL")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.green)
                }
                Spacer()
                
                HStack {
                    Text("Thursday")
                        .font(.callout)
                        .foregroundColor(Color.white)
                    
                    Image("arrow3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 7.0, height: 7.0)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.ultraThinMaterial).opacity(0.5)
            }
            
            HStack(alignment: .bottom, spacing: 12.0) {
                Image(systemName: "figure.jumprope")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(.teal)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                
                VStack(alignment: .leading) {
                    Text("Jump Rope")
                        .font(.title3)
                    
                    Text("482")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.teal)
                    +
                    Text("CAL")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.teal)
                    
                }
                Spacer()
                
                HStack {
                    Text("Tuesday")
                        .font(.callout)
                        .foregroundColor(Color.white)
                    
                    Image("arrow3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 7.0, height: 7.0)
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.ultraThinMaterial).opacity(0.5)
            }
        
            HStack(alignment: .bottom, spacing: 12.0) {
                Image(systemName: "figure.outdoor.cycle")
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                
                VStack(alignment: .leading) {
                    Text("Bicycling")
                        .font(.title3)
                    
                    Text("552")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                    +
                    Text("CAL")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                    
                }
                Spacer()
                
                HStack {
                    Text("Monday")
                        .font(.callout)
                        .foregroundColor(Color.white)
                    
                    Image("arrow3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 7.0, height: 7.0)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(.ultraThinMaterial).opacity(0.5)
            }
        }
    }
    
    // Trends
    var trends: some View {
        
        VStack(spacing: 6.0) {
            HStack {
                Text("Trends")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 4)
                
                Spacer()
                
                Text("Show More")
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundColor(Color.green)
            }
            LazyVGrid(columns: twoColumnGrid, spacing: 6) {
                HStack(alignment: .bottom, spacing: 8) {
                    Image(systemName: "figure.run")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text("Running")
                            .font(.body)
                        
                        Text("55")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.green)
                        +
                        Text("MIN/DAY")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.green)
                    }
                    Spacer()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.ultraThinMaterial).opacity(0.5)
                }
                
                HStack(alignment: .bottom, spacing: 8) {
                    Image(systemName: "figure.walk")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(.teal)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text("Walk")
                            .font(.body)
                        
                        Text("75")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.teal)
                        +
                        Text("MIN/DAY")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.teal)
                    }
                    Spacer()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.ultraThinMaterial).opacity(0.5)
                }
                
                HStack(alignment: .bottom, spacing: 8) {
                    Image(systemName: "figure.jumprope")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text("Jumprope")
                            .font(.body)
                        
                        Text("39")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.pink)
                        +
                        Text("MIN/DAY")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.pink)
                    }
                    Spacer()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.ultraThinMaterial).opacity(0.5)
                }
                
                HStack(alignment: .bottom, spacing: 8) {
                    Image(systemName: "figure.pilates")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text("Core")
                            .font(.body)
                        
                        Text("90")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.blue)
                        +
                        Text("MIN/DAY")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.blue)
                    }
                    Spacer()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.ultraThinMaterial).opacity(0.5)
                }
                
                HStack(alignment: .bottom, spacing: 8) {
                    Image(systemName: "figure.tennis")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text("Tennis")
                            .font(.body)
                        
                        Text("124")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.yellow)
                        +
                        Text("MIN/DAY")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.yellow)
                    }
                    Spacer()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.ultraThinMaterial).opacity(0.5)
                }
                
                HStack(alignment: .bottom, spacing: 8) {
                    Image(systemName: "figure.strengthtraining.traditional")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text("Weights")
                            .font(.body)
                        
                        Text("78")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.orange)
                        +
                        Text("MIN/DAY")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.orange)
                    }
                    Spacer()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.ultraThinMaterial).opacity(0.5)
                }
                
                HStack(alignment: .bottom, spacing: 8) {
                    Image(systemName: "figure.mind.and.body")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(.purple)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text("Yoga")
                            .font(.body)
                        
                        Text("32")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.purple)
                        +
                        Text("MIN/DAY")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.purple)
                    }
                    Spacer()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.ultraThinMaterial).opacity(0.5)
                }
                
                HStack(alignment: .bottom, spacing: 8) {
                    Image(systemName: "figure.indoor.cycle")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(.indigo)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    
                    VStack(alignment: .leading) {
                        Text("Running")
                            .font(.body)
                        
                        Text("67")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.indigo)
                        +
                        Text("MIN/DAY")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.indigo)
                    }
                    Spacer()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(.ultraThinMaterial).opacity(0.5)
                }
            }
        }
    }
}

struct Ring: Identifiable {
    var id = UUID().uuidString
    var progress: CGFloat
    var keyColor: Color
}

var rings:[Ring] = [
    Ring(progress: CGFloat.random(in: 60..<100), keyColor: Color.pink),
    Ring(progress: CGFloat.random(in: 60..<100), keyColor: Color.green),
    Ring(progress: CGFloat.random(in: 60..<100), keyColor: Color.teal)
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
