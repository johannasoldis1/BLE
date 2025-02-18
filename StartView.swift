//
//  StartView.swift
//  HandWave
//
//  Created by Jóhanna Sóldís Hyström on 18.2.2025.
//

import SwiftUI

struct StartView: View {
    @StateObject var emgGraph: emgGraph
    @StateObject var bleManager: BLEManager

    var body: some View {
        VStack {
            // App Header (Logo + Name)
            HStack {
                Image("HandWaveLogo") // Ensure this matches your asset name in Xcode
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40) // Adjust size if needed
                    .clipShape(Circle()) // Ensures a circular logo
                
                Text("Hand Wave")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer() // Pushes content to the left
            }
            .padding(.horizontal)
            .padding(.top, 10) // Adjust top padding for spacing

            Divider() // Adds a subtle line below the header

            // TabView Section
            TabView {
                // Home Page with Instructions
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("How to Use the EMG Device")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                        
                        Text("**Step 1: Preparing the EMG Sensor**")
                            .font(.headline)
                        Text("""
                        1. **Clean the Skin:** Use alcohol wipes where the sensor will be placed for better contact.
                        2. **Attach the Sensor:** Place it on the muscle you want to measure.
                        """)
                        
                        Text("**Step 2: Connecting to the App**")
                            .font(.headline)
                        Text("""
                        1. **Enable Bluetooth** on your phone.
                        2. **Open the App** – The home screen will appear.
                        3. **Go to 'Graph' tab** and select your sensor to connect.
                        """)
                        
                        Text("**Step 3: Recording and Analyzing EMG Data**")
                            .font(.headline)
                        Text("""
                        1. **Go to 'Graph' Tab** to view real-time EMG signals.
                        2. **Start Recording** and perform your muscle activity.
                        3. **Stop and Save** when done, then export data as needed.
                        """)
                        
                        Text("**Step 4: Reviewing and Exporting Data**")
                            .font(.headline)
                        Text("""
                        - **View previous recordings** in the 'Data' tab.
                        - **Export data** in CSV format for further analysis.
                        """)
                        
                        // Button to navigate to the Graph UI (Existing ContentView)
                        NavigationLink(destination: ContentView(emgGraph: emgGraph, bleManager: bleManager)) {
                        }
                        .padding(.top, 20)
                    }
                    .padding()
                }
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                
                // Graph Tab - Loads the existing ContentView.swift
                ContentView(emgGraph: emgGraph, bleManager: bleManager)
                    .tabItem {
                        Image(systemName: "waveform.path.ecg")
                        Text("Graph")
                    }
                
                // Data Tab - Calls the new DataView.swift
                DataView()
                    .tabItem {
                        Image(systemName: "doc.text")
                        Text("Data")
                    }
            }
            .background(Color.white) // Ensures no transparency issues
        }
    }
}
