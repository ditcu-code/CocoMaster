//
//  Components.swift
//  TreeOfLife
//
//  Created by Aditya Cahyo on 22/04/22.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    var isBrown: Bool = false
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(isBrown ? .brown : Color.whiteFloral)
            .foregroundColor(isBrown ? .white : .brown)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

extension Color {
    static let greenGossip = Color("gossip-green")
    static let whiteFloral = Color("floral-white")
    static let lemonChiffon = Color("lemon-chiffon")
}

struct Droppable: ViewModifier {
    let condition: Bool
    let types: [String]
    let dropDelegating: DropDelegate
    
    @ViewBuilder
    func body(content: Content) -> some View {
        if condition {
            content.onDrop(of: types, delegate: dropDelegating)
        } else {
            content
        }
    }
}

extension View {
    public func acceptDrop(if condition: Bool, of supportedTypes: [String], delegate: DropDelegate) -> some View {
        self.modifier(Droppable(condition: condition, types: supportedTypes, dropDelegating: delegate))
    }
}

struct StartingDialog: View {
    @Binding var isShow: Bool
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Rectangle().opacity(0.5).overlay(
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.lemonChiffon)
                    
                    VStack {
                        Image("gem")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .padding(.top, 40)
                            .padding(.bottom, 20)
                        Text("You have to find 14 products to be CocoMaster")
                            .font(.custom("Avenir", size: 28))
                            .fontWeight(.medium)
                            .foregroundColor(.brown)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Button(action: {
                            isShow = false
                        }) {
                            Text("Go")
                                .font(.custom("Avenir", size: 24))
                                .fontWeight(.medium)
                                .frame(width: 100, height: 50)
                        }.buttonStyle(GrowingButton(isBrown: true)).padding(.bottom, 40)
                    }.padding(.horizontal, 30)
                    
                
            }.frame(width: width, height: height)
        )
    }
}

struct FinishingDialog: View {
    @Binding var isShow: Bool
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        Rectangle().opacity(0.5).overlay(
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.lemonChiffon)
                    
                    VStack {
                        Image("coco-master")
                            .resizable()
                            .frame(width: 220, height: 220)
                            .padding(.top, 40)
                            .padding(.bottom, 20)
                        Text("You are a CocoMaster!")
                            .font(.custom("Avenir", size: 32))
                            .fontWeight(.heavy)
                            .foregroundColor(.brown)
                        Text("May Mighty Coco will guide you to tropical paradise")
                            .font(.custom("Avenir", size: 22))
                            .fontWeight(.medium)
                            .foregroundColor(.brown)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        NavigationLink(destination: ContentView()) {
                            Text("Hooray!")
                                .font(.custom("Avenir", size: 30))
                                .fontWeight(.heavy)
                                .frame(width: 160, height: 50)
                        }.buttonStyle(GrowingButton(isBrown: true)).padding(.top, 20)
                        Button(action: {
                            isShow = false
                        }) {
                            Text("Back to learn")
                                .font(.custom("Avenir", size: 18))
                                .foregroundColor(.brown)
                        }.padding(.bottom, 40).padding(.top, 10)
                    }.padding(.horizontal, 30)
                 
                
            }.frame(width: width, height: height)
        )
    }
}
