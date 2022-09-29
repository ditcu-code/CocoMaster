//
//  ObjectModel.swift
//  TreeOfLife
//
//  Created by Aditya Cahyo on 22/04/22.
//

import Foundation

struct CocoInfo: Codable {
    var id = UUID()
    var image: Coco
    var cocoStatus: CocoArrayType = .all
    var description: String
    var madeFrom: [Coco]
    var separateTo: [Coco]
    var processTo: [Coco]
    var url: String?
}

struct CocoModel {
    var allList: [CocoInfo]
    var boxList: [CocoInfo]
}

class GlobalObject: ObservableObject {
    @Published var cocoArray: CocoModel = CocoModel(
        allList: [Coco.tree.info],
        boxList: []
    )
}

enum CocoArrayType: Int, Codable {
    case all = 0
    case box
}
