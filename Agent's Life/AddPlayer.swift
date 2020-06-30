//
//  AddPlayer.swift
//  Agent's Life
//
//  Created by Nikhil Goel on 6/29/20.
//  Copyright © 2020 Nikhil Goel. All rights reserved.
//

import SwiftUI

struct AddPlayer: View {
    var addedPlayers = PlayerList(amount: 10)
    
    var existingPlayers: PlayerList
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Hitter")) {
                        ForEach(addedPlayers.hitters) { hitters in
                            NavigationLink(destination: PlayerDescription(player: hitters, existingPlayers: self.existingPlayers)) {
                                Text("\(hitters.name)")
                            }
                        }
                    }
                    Section(header: Text("Pitcher")) {
                        ForEach(addedPlayers.pitchers) { pitcher in
                            NavigationLink(destination: PlayerDescription(player: pitcher, existingPlayers: self.existingPlayers)) {
                                Text("\(pitcher.name)")
                            }
                        }
                    }

                }
            }
            .navigationBarTitle("Add Player", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
            })

        }
    }
}

struct AddPlayer_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayer(existingPlayers: PlayerList(amount: 2))
    }
}
