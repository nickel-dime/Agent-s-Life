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
    var existingPlayers: PlayerList
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var offerDone = false
    @State var alertTitle = ""
    @State var alertMessage = ""
    
    var body: some View {
        VStack {
            Text("Power: \(player.stat1)")
            Text("Contact: \(player.stat2)")
            Text("Speed: \(player.stat3)")
            Text("Fielding: \(player.stat4)")
            Text("Throwing: \(player.stat5)")
            Text("Grade: \(player.averageGrade)")
            Button("Offer Contract") {
                self.addToList()
            }

        }
        .alert(isPresented: $offerDone) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")) {
                self.presentationMode.wrappedValue.dismiss()
                })
        }
        .navigationBarTitle(Text(player.name), displayMode: .inline)
    }
    
    func addToList() {
        if player.type == 0 {
            if contractNegotiation() && offerDone == false {
                existingPlayers.pitchers.append(player)
                self.alertTitle = "Success"
                self.alertMessage = "You have just signed a player!"
            } else {
                self.alertTitle = "Declined"
                self.alertMessage = "Increase your reputation to sign more players!"
            }
        } else {
            if contractNegotiation() && offerDone == false {
                existingPlayers.hitters.append(player)
                self.alertTitle = "Success"
                self.alertMessage = "You have just signed a player!"
            } else {
                self.alertTitle = "Declined"
                self.alertMessage = "Increase your reputation to sign more players!"
            }
        }
        self.offerDone = true
    }
    
    func contractNegotiation() -> Bool {
        let rand = Int.random(in: 1..<10)
        switch player.averageGrade {
        case "A+":
            if (rand == 10) {
                return true
            }
        case "A":
            if (rand > 9) {
                return true
            }
        case "B":
            if (rand > 7) {
                return true
            }
        case "C":
            if (rand > 5) {
                return true
            }
        case "D":
            if (rand > 3) {
                return true
            }
        case "F":
            if (rand > 1) {
                return true
            }
        default:
            return false
        }
        return false
    }
}

struct PlayerDescription_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDescription(player: Player(), existingPlayers: PlayerList(amount: 2))
    }
}
