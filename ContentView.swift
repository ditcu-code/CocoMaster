import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.greenGossip.ignoresSafeArea()
                VStack(alignment: .center, spacing: 100) {
                    VStack {
                        Text("CocoMaster")
                            .font(.custom("Avenir", size: 80))
                            .fontWeight(.bold)
                        Text("Tree of Life")
                            .font(.custom("Avenir", size: 36))
                            .fontWeight(.medium)
                    }.foregroundColor(.white)
                    VStack {
                        NavigationLink(destination: GameView()) {
                            Text("Start")
                                .font(.custom("Avenir", size: 30))
                                .fontWeight(.heavy)
                                .frame(width: 250, height: 65)
                        }.buttonStyle(GrowingButton())
                        NavigationLink(destination: About()) {
                            Text("About")
                                .font(.custom("Avenir", size: 24))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                
                        }.padding(.top, 20)
                    }
                }.padding(.bottom, 100)
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden(true)
    }
}


