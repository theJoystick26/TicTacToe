//
//  ContentView.swift
//  TicTacToe
//
//  Created by Adin Joyce on 8/8/22.
//

import SwiftUI

struct ContentView: View {
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(.blue).opacity(0.7)
                                .frame(width: geometry.size.width / 3 - 15, height: geometry.size.width / 3 - 15)
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
