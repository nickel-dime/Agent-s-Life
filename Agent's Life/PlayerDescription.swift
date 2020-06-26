//
//  PlayerDescription.swift
//  Agent's Life
//
//  Created by Nikhil Goel on 6/26/20.
//  Copyright © 2020 Nikhil Goel. All rights reserved.
//

import SwiftUI

struct PlayerDescription: View {
    
    var player: Player
    
    var body: some View {
        VStack {
            Text("Power: \(player.stat1)")
            Text("Contact: \(player.stat2)")
            Text("Speed: \(player.stat3)")
            Text("Fielding: \(player.stat4)")
            Text("Throwing: \(player.stat5)")
        }
        .navigationBarTitle(Text(player.name), displayMode: .inline)
    }
}

struct PlayerDescription_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDescription(player: Player())
    }
}
