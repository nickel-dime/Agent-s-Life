//
//  ContentView.swift
//  Agent's Life
//
//  Created by Nikhil Goel on 6/26/20.
//  Copyright © 2020 Nikhil Goel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var players = PlayerList(amount: 0)
    @State var addPlayer = false
    
    // change NavigationLink to a playerdescription screen when you own a player
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Hitter")) {
                        ForEach(players.hitters) { hitters in
                            NavigationLink(destination: PlayerDescription(player: hitters, existingPlayers: self.players)) {
                                Text("\(hitters.name)")
                            }
                        }
                    }
                    Section(header: Text("Pitcher")) {
                        ForEach(players.pitchers) { pitcher in
                            NavigationLink(destination: PlayerDescription(player: pitcher, existingPlayers: self.players)) {
                                Text("\(pitcher.name)")
                            }
                        }
                    }

                }
            }
            .navigationBarTitle("Agent's Life")
            .navigationBarItems(trailing:
                Button(action: {
                    self.addPlayer.toggle()
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $addPlayer) {
                    VStack {
                        AddPlayer(existingPlayers: self.players)
                    }
                    .navigationBarTitle("Agent's Life")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
