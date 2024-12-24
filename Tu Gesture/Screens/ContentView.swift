//
//  ContentView.swift
//  Tu Gesture
//
//  Created by Ahmed El Gndy on 24/12/2024.
//

import SwiftUI

struct ContentView: View {
    //MARK: PROPERTY
    @State private var isAnimation:Bool = false
    @State private var imageScale:CGFloat = 1
    @State private var imageOffset: CGSize = .zero
   
    //MARK: FCNCTIONS
    func resetImageSate () {
        withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    //MARK: CONTENT
    var body: some View {

        NavigationView {
            ZStack {
                Color.clear
                
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding()
                    .opacity(isAnimation ? 1 : 0)
                    .blur(radius: isAnimation ? 0 : 3)
                    .animation(.linear(duration: 1), value: isAnimation)
                    .offset(imageOffset)
                    .scaleEffect(imageScale)
                    //MARK: Double Gesture
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 2
                            }
                        }else {
                            resetImageSate ()
                        }
                    })//: GESTURE
                //MARK: Drag Gesture
                    .gesture(
                        DragGesture()
                            .onChanged{ Value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = Value.translation
                                }
                            }
                            .onEnded{ _  in
                                if imageScale <= 1{
                                    resetImageSate ()
                                }
                            }
                )
                 
            }//: ZSTACK
            .navigationTitle("Zoom in ")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                isAnimation.toggle()
            })
            //MARK: -INFO PANEL
            .overlay(
                InofPanelView(scale: imageScale, offset: imageOffset)
                    .padding()
                ,alignment: .top
            )
            
        }//:NAGIGATON
        .navigationViewStyle(.stack)
     
    }
}


//MARK: PREVIEW
#Preview {
    ContentView()
}
