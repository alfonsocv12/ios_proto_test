//
//  ContentView.swift
//  ios_proto
//
//  Created by Alfonso Villalobos on 15/02/23.
//

import SwiftUI
import protobuf

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Click", action: onClick)
                .accessibilityLabel("Click")
        }
        .padding()
    }
    
    func onClick() -> Void {
        Service().getPlayers()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
