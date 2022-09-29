//
//  Credits.swift
//  CocoMaster
//
//  Created by Aditya Cahyo on 25/04/22.
//

import SwiftUI

struct About: View {
    var body: some View {
        
        ZStack {
            Color.greenGossip.ignoresSafeArea()
            
            ScrollView {
                VStack{
                    Text("Made by\nAditya Cahyo Utomo")
                        .font(.custom("Avenir", size: 36))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                    
                    Group{
                        Text("Icons and images used on this app:").bold()
                        Text("[Leaf icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/leaf)")
                        Text("[Coconut icons created by Good Ware - Flaticon](https://www.flaticon.com/free-icons/coconut)")
                        Text("[Ketupat images created by Hannah - Kindpng](https://www.kindpng.com/imgv/ixoRmTo_sticker-ketupat-png-download-transparent-background-ketupat-png/)")
                        Text("[Coconut images created by Utima - Flaticon](https://create.vista.com/unlimited/stock-photos/41681217/stock-photo-coconut-fruit-piece-isolated-on/)")
                        Text("[Coconut milk icons created by Smashicons - Flaticon](https://www.flaticon.com/free-icons/coconut-milk)")
                    }.font(.custom("Avenir", size: 22)).foregroundColor(.white)
                    Group{
                        Text("[Coconut oil icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/coconut-oil)")
                        Text("[Soil icons created by Smashicons - Flaticon](https://www.flaticon.com/free-icons/soil)")
                        Text("[Dye images created by Kiara Farbos - Pngitem](https://www.pngitem.com/middle/iTbTmbm_transparent-color-powder-png-red-pigment-png-png/)")
                        Text("[Traditional medicine icons created by surang - Flaticon](https://www.flaticon.com/free-icons/traditional-medicine)")
                        Text("[Vinegar icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/vinegar)")
                        Text("[Sugar image created by Pngegg](https://www.pngegg.com/en/png-wczrd)")
                        Text("[Oil icons created by Eucalyp - Flaticon](https://www.flaticon.com/free-icons/oil)")
                        Text("[Greek icons created by Freepik - Flaticon](https://www.flaticon.com/free-icons/greek)")
                    }.font(.custom("Avenir", size: 22))
                }
            }
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
