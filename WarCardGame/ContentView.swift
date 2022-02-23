//
//  ContentView.swift
//  WarCardGame
//
//  Created by Derrick White on 2/21/22.
//

import SwiftUI

struct ContentView: View {
    @State var playerScore: Int = 0
    @State var cpuScore: Int = 0
    @State var playerCard: String = "back"
    @State var cpuCard: String = "back"
    @State var winner: String? = "Me"
    var winningScore: Int = 10
    
    var body: some View {
        ZStack {
            Image("background")
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer ()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                VStack(spacing: 50.0) {
                    if winner != nil {
                        Text("The winner is " + winner!)
                            .font(.headline)
                            .foregroundColor(.white)
                    } else {
                        Button(action: {
                            if winner == nil {
                                let playerRand = Int.random(in: 2...14)
                                let cpuRand = Int.random(in: 2...14)
                                
                                playerCard = "card" + String(playerRand)
                                cpuCard = "card" + String(cpuRand)
                                
                                if playerRand > cpuRand {
                                    playerScore += 1
                                } else if cpuRand > playerRand{
                                    cpuScore += 1
                                }
                                
                                if playerScore == winningScore {
                                    winner = "Player"
                                } else if cpuScore == winningScore{
                                    winner = "CPU"
                                }
                            }
                        }, label: {
                            Image("dealbutton")
                        })
                    }
                    Button(action: {
                        playerCard = "back"
                        cpuCard = "back"
                        playerScore = 0
                        cpuScore = 0
                        winner = nil
                    }, label: {
                        Text("Restart")
                            .foregroundColor(.white)
                    })
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
