//
//  Alerts.swift
//  TicTacToe
//
//  Created by Adin Joyce on 8/9/22.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin = AlertItem(title: Text("You win!"),
                             message: Text("You are so smart. You beat your own AI"),
                             buttonTitle: Text("Hell yeah"))
    static let computerWin = AlertItem(title: Text("You lost!"),
                             message: Text("You programmed a super AI."),
                             buttonTitle: Text("Rematch"))
    static let draw = AlertItem(title: Text("Draw"),
                             message: Text("No one won."),
                             buttonTitle: Text("Try again"))
}
