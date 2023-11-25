//
//  CadrdView.swift
//  Hike
//
//  Created by Denis Aleshyn on 18/10/2023.
//

import Foundation
import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        print("---The button was pressed---")
        print("Status: OldImage Number = \(imageNumber)")
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: rundom number generated = \(randomNumber)")
        } while randomNumber == imageNumber
        imageNumber = randomNumber
        print("Result: New Image Number = \(imageNumber)")
        print("--- THE END ---")
        print("\n")
    }
    
    var body: some View {
        // MARK: - CARD
            ZStack {
                CustomBackgroundView()
                VStack {
                    // MARK: - HEADER
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Hiking")
                                .fontWeight(.black)
                                .font(.system(size: 52))
                                .foregroundStyle(
                                LinearGradient(colors: [
                                    Color.customGrayLight,
                                    Color.customGrayMedium
                                ], startPoint: .top,
                                     endPoint: .bottom)
                            )
                            Spacer()
                            Button {
                                // Action to show a sheet
                                isShowingSheet.toggle()
                            } label: {
                                 CustomButtonView()
                            }
                            .sheet(isPresented: $isShowingSheet) {
                                SettingsView()
                                    .presentationDragIndicator(.visible)
                                    .presentationDetents([.medium, .large])
                            }
                        }
                        Text("Fun and enjoyable outdoor activity for friends and families")
                            .multilineTextAlignment(.leading)
                            .italic()
                            .foregroundColor(.customGrayMedium)
                        
                        
                    }// : HEADER
                    .padding(.horizontal, 30)
                    // MARK: - MAIN CONTENT
                    ZStack {
                        CustomCircleView()
                        Image("image-\(imageNumber)")
                            .resizable()
                            .scaledToFit()
                            .animation(.default, value: imageNumber)
                    }
                    // MARK: - FOOTER
                    
                    Button {
                        // ACTION: Generate a random number
                        randomImage()
                    } label: {
                        Text("ExploreMore")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundStyle(
                                LinearGradient(colors: [.customGreenLight,
                                                        .customGreenMedium],
                                               startPoint: .top,
                                               endPoint: .bottom)
                            )
                            .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                    }
                    .buttonStyle(GradientButton())
                } //: ZSTACK
            }//: CARD
            .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .padding()
    }
}
