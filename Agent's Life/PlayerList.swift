//
//  PlayerList.swift
//  Agent's Life
//
//  Created by Nikhil Goel on 6/26/20.
//  Copyright © 2020 Nikhil Goel. All rights reserved.
//

import Foundation

class PlayerList: ObservableObject {
    @Published var pitchers = [Player]()
    @Published var hitters = [Player]()

    var amount: Int

    init(amount: Int) {
        self.amount = amount
        for _ in 0..<amount {
            pitchers.append(Player(type: 1))
            hitters.append(Player(type: 0))
        }
    }
}
