//
//  BoxListView.swift
//  TreeOfLife
//
//  Created by Aditya Cahyo on 22/04/22.
//

import SwiftUI
import UniformTypeIdentifiers

struct BoxListView: View {
    @Binding var array: [CocoInfo]
    var cocoType: CocoArrayType
    var viewModel: GlobalObject
    
    private func convertModelToData(model: CocoInfo) -> NSItemProvider? {
        do {
            let dataBlob = try PropertyListEncoder().encode(model)
            return NSItemProvider(item: dataBlob as NSData, typeIdentifier: UTType.data.identifier as String)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
        return nil
    }

    var body: some View {
        if cocoType == .all {
            GeometryReader { geometry in
                ScrollView {
                    let isPortrait = geometry.size.width < 400
                    let column = Array(repeating: GridItem(.flexible()), count: isPortrait ? 1 : 2)
                    LazyVGrid(columns: column, spacing: 20) {
                        ForEach(0 ..< array.count, id: \.self) { i in
                            ZStack {
                                
                                Rectangle()
                                    .fill(.white)
                                    .cornerRadius(20)
                                    .frame(maxWidth: isPortrait ? 400 : geometry.size.width / 2 - 10, minHeight: 270)
                                if array[i].separateTo.isEmpty && array[i].processTo.isEmpty {
                                    Image("gem")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .position(x: 30, y: 30)
                                }
                                VStack {
                                    Image("\(array[i].image.rawValue)")
                                        .resizable()
                                        .frame(width: 175, height: 175)
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                    Text("\(array[i].image.title)")
                                        .font(.custom("Avenir", size: 24))
                                        .fontWeight(.bold)
                                        .foregroundColor(.brown)
                                }
                            }
                            .onDrag {
                                let itemProvider = convertModelToData(model: array[i])!
                                return itemProvider
                            }
                        }
                    }
                    .animation(.spring(), value: array.count)
                    if array.count == 0 {
                        HStack(alignment: .center) {
                            Text("Separate an item to obtain new items")
                                .font(.custom("Avenir", size: 16))
                                .foregroundColor(.white)
                                .opacity(0.5)
                        }.frame(width: geometry.size.width, height: 50)
                    }
                }
                .padding(.bottom, 20)
                .onDrop(
                    of: [UTType.data.identifier as String],
                    delegate: CocoDropDelegate( array: $array, cocoType: cocoType, viewModel: viewModel)
                )
            }
        } else {
            let isNotEmpty = array.count > 0
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.brown, style: StrokeStyle(lineWidth: 5, lineCap: .square, lineJoin: .miter, miterLimit: 0, dash: isNotEmpty ? [0, 0] : [7, 14], dashPhase: 0))
                    .frame(width: 275, height: 275)
                    .background(Color.lemonChiffon)
                    .shadow(color: .brown, radius: isNotEmpty ? 36 : 0)
                    .overlay(Text(isNotEmpty ? "" : "Drop item here").font(.custom("Avenir", size: 16)).foregroundColor(.brown).opacity(0.5))
                ForEach(0 ..< array.count, id: \.self) { i in
                    Image("\(array[i].image.rawValue)")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .aspectRatio(contentMode: .fit)
                        .onDrag {
                            let itemProvider = convertModelToData(model: array[i])!
                            return itemProvider
                        }
                }
            }
            .acceptDrop(
                if: array.count < 1,
                of: [UTType.data.identifier as String],
                delegate: CocoDropDelegate(array: $array, cocoType: cocoType, viewModel: viewModel)
            )
        }
    }
}


struct CocoDropDelegate: DropDelegate {
    @Binding var array: [CocoInfo]
    var cocoType: CocoArrayType
    var viewModel: GlobalObject
    
    func performDrop(info: DropInfo) -> Bool {
        guard info.hasItemsConforming(to: [UTType.data.identifier as String]) else {
            return false
        }
        let items = info.itemProviders(for: [UTType.data.identifier as String])
        guard let item = items.first else {
            return false
        }
        item.loadDataRepresentation(forTypeIdentifier: UTType.data.identifier as String) { (data, error) in
            guard error == nil else {
                print("Error: ", error.debugDescription)
                return
            }
            guard let responseData = data else {
                return
            }
            do {
                var dataBlob = try PropertyListDecoder().decode(CocoInfo.self, from: responseData)
                DispatchQueue.main.async {
                    withAnimation() {
                        switch dataBlob.cocoStatus {
                        case .all:
                            guard let index = self.viewModel.cocoArray.allList.map({ $0.id }).firstIndex(of: dataBlob.id) else {
                                return
                            }
                            self.viewModel.cocoArray.allList.remove(at: index)
                        case .box:
                            guard let index = self.viewModel.cocoArray.boxList.map({ $0.id }).firstIndex(of: dataBlob.id) else {
                                return
                            }
                            self.viewModel.cocoArray.boxList.remove(at: index)
                        }
                        dataBlob.cocoStatus = CocoArrayType(rawValue: cocoType.rawValue) ?? .all
                        self.array.append(dataBlob)
                    }
                }
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
        return true
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func dropEntered(info: DropInfo) {
    }
    
    func dropExited(info: DropInfo) {
        
    }
}
