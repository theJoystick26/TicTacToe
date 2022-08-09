//
//  GameView.swift
//  TicTacToe
//
//  Created by Adin Joyce on 8/8/22.
//

import SwiftUI

struct GameView: View {
    @StateObject private var vm = GameViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: vm.columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack {
                            GameSquareView(proxy: geometry)
                            PlayerIndicator(systemImageName: vm.moves[i]?.indicator ?? "")
                        }
                        .onTapGesture {
                            vm.processPlayerMove(for: i)
                        }
                    }
                }
                Spacer()
            }
            .disabled(vm.isGameboardDisabled)
            .padding()
            .alert(item: $vm.alertItem, content: { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: .default(alertItem.buttonTitle, action: {
                    vm.resetGame()
                }))
            })
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
        GameView()
    }
}

struct GameSquareView: View {
    var proxy: GeometryProxy
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundColor(.blue).opacity(0.7)
            .frame(width: proxy.size.width / 3 - 15, height: proxy.size.width / 3 - 15)
    }
}

struct PlayerIndicator: View {
    var systemImageName: String
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(.white)
    }
}
