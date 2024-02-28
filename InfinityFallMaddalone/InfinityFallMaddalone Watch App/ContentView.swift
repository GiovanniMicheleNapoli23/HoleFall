//
//  ContentView.swift
//  InfinityFallMaddalone Watch App
//
//  Created by Giovanni Michele on 28/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var score = 0
    @State var getScore = 0
    @State var isGameStart : Bool = false
    @State var dinoPosY = 0.0
    @State var dinoState : DinoStateModel = .walk
    @State var colliderHit = false
    @State private var playLabelOpacity = 1.0
    
    var body: some View {
        ZStack{
           
            ObstacleView(colliderHit: $colliderHit, isGameStart: $isGameStart, getScore: $getScore, dinoPosY: $dinoPosY, dinoState: $dinoState)
                .offset(y: 0)
            scoreLabel
 
                
            DinoView(dinoPosY: $dinoPosY, dinoState: $dinoState, isGameStart: $isGameStart)
                .rotationEffect(.degrees(90))
                .offset(x: -122)
            replayButton
                .offset(y: -29)
            playLabel
        }
        .scaleEffect(0.5)
    }
}
extension ContentView {
    private var scoreLabel: some View {
        HStack{
            Text("HI \(String(format: "%.5d", getScore))")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color(.darkGray))
        }
        .frame(maxWidth: 350, maxHeight: .infinity)
        .padding(.bottom, 300)
        .zIndex(1)
    }
    private var replayButton: some View {
        VStack{
            Spacer()
            if dinoState == .gameOver {
                Button {
                    dinoPosY = -7
                    dinoState = .walk
                    colliderHit = false
                    isGameStart = true
                    score = 0
                    getScore = 0
                    
                } label: {
                    VStack{
                        
                        Image("btn-play-again")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 72)
                        Text("play again".uppercased())
                            .font(.title2)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                    }
                }
                .padding()
            }
        }
    }
    
    private var playLabel: some View {
        VStack{
            
            Text("Touch Dino".uppercased())
            Text("to Play")
                .font(.title2)
                .foregroundColor(.gray)
                .fontWeight(.bold)
        }
        .opacity(playLabelOpacity)
        .onAppear{
            withAnimation(.spring().delay(2)){
                playLabelOpacity = 0.0
            }
        }
    }
}

#Preview {
    ContentView()
}
