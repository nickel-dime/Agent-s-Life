//
//  ContentView.swift
//  Agent's Life
//
//  Created by Nikhil Goel on 6/26/20.
//  Copyright © 2020 Nikhil Goel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    
    var players = PlayerList(amount: 10)
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Hitter")) {
                        ForEach(players.hitters) { hitters in
                            NavigationLink(destination: PlayerDescription(player: hitters)) {
                                Text("\(hitters.name)")
                            }
                        }
                    }
                    Section(header: Text("Pitcher")) {
                        ForEach(players.pitchers) { pitcher in
                            NavigationLink(destination: PlayerDescription(player: pitcher)) {
                                Text("\(pitcher.name)")
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitle("Agent's Life")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
