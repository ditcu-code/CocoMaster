//
//  GameView.swift
//  TreeOfLife
//
//  Created by Aditya Cahyo on 21/04/22.
//

import SwiftUI

struct GameView: View {
    @State private var taskTypes: [CocoArrayType] = [.all, .box]
    @StateObject var viewGlobal = GlobalObject()
    
    @State var startDialog: Bool = true
    @State var finishDialog: Bool = true
    
    func separator(_ item: [CocoInfo]) -> Void {
        viewGlobal.cocoArray.allList.insert(contentsOf: item, at: 0)
        viewGlobal.cocoArray.boxList = []
    }
    
    var allProductItems = Coco.allCases.map {$0.info}.filter {$0.processTo.isEmpty && $0.separateTo.isEmpty}
    
    var body: some View {
        let theItem = viewGlobal.cocoArray.boxList.first
        let productItemsFound = viewGlobal.cocoArray.allList.filter {$0.processTo.isEmpty && $0.separateTo.isEmpty}
        let isGameFinished = productItemsFound.count == allProductItems.count
        
        ZStack {
            GeometryReader { geometry in
                
                HStack(alignment:.top) {
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.greenGossip)
                        
                        VStack{
                            Text("Coconut Items")
                                .font(.custom("Avenir", size: 36))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 50)
                            BoxListView(array: $viewGlobal.cocoArray.allList, cocoType: .all, viewModel: viewGlobal).padding(.horizontal, 20)
                        }
                    }.frame(width: geometry.size.width / 3, height: geometry.size.height)
                    
                    ZStack {
                        ScrollView {
                            VStack {
                                BoxListView(array: $viewGlobal.cocoArray.boxList, cocoType: .box, viewModel: viewGlobal)
                                HStack(alignment: .center, spacing: 20) {
                                    if theItem != nil && !theItem!.separateTo.isEmpty {
                                        Button(action: {
                                            separator(theItem!.separateTo.map {$0.info} )
                                        }) {
                                            Text("Separate")
                                                .font(.custom("Avenir", size: 24))
                                                .fontWeight(.medium)
                                                .frame(width: 190, height: 50)
                                        }.buttonStyle(GrowingButton(isBrown: true))
                                    }
                                    if theItem != nil && !theItem!.processTo.isEmpty  {
                                        Button(action: {
                                            separator(theItem!.processTo.map {$0.info} )
                                        }) {
                                            Text("Process")
                                                .font(.custom("Avenir", size: 24))
                                                .fontWeight(.medium)
                                                .frame(width: 190, height: 50)
                                        }.buttonStyle(GrowingButton(isBrown: true))
                                    }
                                }.padding(.vertical, 20)
                                Divider()
                                VStack(alignment: .leading) {
                                    Text(theItem?.image.title ?? "")
                                        .font(.custom("Avenir", size: 48))
                                        .fontWeight(.bold)
                                        .foregroundColor(.brown)
                                    Text(theItem?.description ?? "")
                                        .font(.custom("Avenir", size: 22))
                                        .fontWeight(.medium)
                                        .foregroundColor(.brown)
                                }.padding(.horizontal, 30)
                            }
                        }
                        .frame(width: geometry.size.width / 3 * 2, height: geometry.size.height)
                        .padding(.top, 80)
                        
                        ProductCounter(current: productItemsFound.count, all: allProductItems.count)
                    }
                }
                
                ZStack{
                    if startDialog {
                        StartingDialog(isShow: $startDialog, width: geometry.size.width / 3 + 75, height: geometry.size.height / 3)
                    }
                    
                    if finishDialog && isGameFinished {
                        FinishingDialog(isShow: $finishDialog, width: geometry.size.width / 3 + 75, height: geometry.size.height / 3)
                    }
                }.animation(.linear, value: startDialog || finishDialog)
                
            }
            .background(Color.whiteFloral).ignoresSafeArea()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}

struct ProductCounter: View {
    var current: Int
    var all: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.lemonChiffon)
            HStack {
                Image("gem")
                    .resizable()
                    .frame(width: 35, height: 35)
                Spacer()
                Text("\(current) / \(all)")
                    .font(.custom("Avenir", size: 24))
                    .fontWeight(.medium)
                    .foregroundColor(.brown)
            }
            .padding(.horizontal, 10)
        }
        .frame(width: 140, height: 50)
        .position(x: 100, y: 75)
        
    }
}

