//
//  DinoView.swift
//  InfinityFallMaddalone Watch App
//
//  Created by Giovanni Michele on 28/02/24.
//

import SwiftUI

struct DinoView: View {

    @State private var dinoCurrentImage = UIImage(named: "maddalone")!
    
    @Binding var dinoPosY: Double
    @State var dinoPosX = -129.0
    @Binding var dinoState : DinoStateModel
    let timer = Timer.publish(every: 0.0258, on: .main, in: .common).autoconnect()
    @State private var isJumping = false
    @State private var isFixPosX = false
    @Binding var isGameStart : Bool
    var body: some View {
        ZStack{
            dinoImageView
                .offset(x: dinoPosX, y: dinoPosY)
//                .rotationEffect(.degrees(90))
                .onAppear{
                    getDinoState(state: dinoState)

                }
                .onChange(of: dinoState) { newDinoState in
                    getDinoState(state: newDinoState)
                }
                .onTapGesture {

                    if dinoState == .walk {
                        getDinoState(state: .jump)
                        isGameStart = true
                    }

                }
        }
        .onReceive(timer) { _ in
            
            
            if dinoState == .jump {
                if dinoPosY > -92 && !isJumping{
                    dinoPosY -= 14
                    // dinoPosX += 3.29
                }
                else if dinoPosY > -158 && !isJumping{
                    dinoPosY -= 10
                    // dinoPosX += 3.29
                }
                else if dinoPosY > -207 && !isJumping{
                    dinoPosY -= 5
                    // dinoPosX += 3.29
                }
                
                else if dinoPosY < -7 && isJumping{
                    dinoPosY += 10
                    // dinoPosX += 3.29
                }
                
                
                
                if dinoPosY <= -207 {
                    isJumping = true
                    isFixPosX = false
                }
                else if dinoPosY >= -7 && isJumping {
                    isJumping = false
                    getDinoState(state: .walk)
                }
            }
            else if dinoState == .walk {
                if !isFixPosX {
                    isFixPosX.toggle()
                    
                }
            }
        }
    }
}
extension DinoView{
    
    private var dinoImageView: some View {

        Image(.maddalone)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: 100)

    }

    func getDinoState(state newDinoState: DinoStateModel){
        dinoState = newDinoState
        
        switch newDinoState {
        case .walk:
            dinoCurrentImage = UIImage(named: newDinoState.imageName)!

        case .gameOver:
            dinoCurrentImage = UIImage(named: newDinoState.imageName)!
        default:
            dinoCurrentImage = UIImage(named: newDinoState.imageName)!
        }
    }

    
}

#Preview {
    DinoView(dinoPosY: .constant(0), dinoState: .constant(.walk), isGameStart: .constant(false))
}
