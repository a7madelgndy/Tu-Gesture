//
//  ContentView.swift
//  Tu Gesture
//
//  Created by Ahmed El Gndy on 24/12/2024.
//

import SwiftUI

struct ContentView: View {
    //MARK: PROPERTy
    @State private var isAnimation:Bool = false
    @State private var scaleImage:CGFloat = 1
    //MARK: FCNCtion
    //MARK: CONTENT
    var body: some View {

        NavigationView {
            ZStack {
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding()
                    .opacity(isAnimation ? 1 : 0)
                    .blur(radius: isAnimation ? 0 : 3)
                    .animation(.linear(duration: 1), value: isAnimation)
                    .scaleEffect(scaleImage)
                    .onTapGesture(count: 2, perform: {
                        if scaleImage == 1 {
                            withAnimation(.spring()) {
                                scaleImage = 2
                            }
                        }else {
                            withAnimation(.spring()) {
                                scaleImage = 1
                            }
                        }//: GESTURE
                    })
                
                 
            }//: ZSTACK
            .navigationTitle("Zoom in ")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                isAnimation.toggle()
            })
            
        }//:NAGIGATON
        .navigationViewStyle(.stack)
     
    }
}


//MARK: PREVIEW
#Preview {
    ContentView()
}
