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
    @State private var isDrawenOpened: Bool = false
    
    @State private var   drawerIcon: String = "left"
   
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
                Color.blue
                
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
                                imageScale = 5
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
                //MARK: Magnification Gesture
                     .gesture(
                        MagnificationGesture()
                            .onChanged{value in
                                if imageScale >= 1 && imageScale <= 5 {
                                    imageScale = value
                                }else if imageScale>5{
                                    imageScale = 5
                                }
                            }
                            .onEnded{ _ in
                                if imageScale > 5 {
                                    imageScale = 5
                                } else if imageScale <= 1 {
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
            )//: info Panel
            
            //MARK: CONTROLLERS
            .overlay(
                HStack {
                    //Scale down
                    Button{
                        withAnimation(.spring()) {
                            if imageScale > 1 {
                                imageScale -= 1
                                if imageScale <= 1 {//Safety precaution
                                    resetImageSate()
                                }
                            }
                        }
                    }label: {
                        ControllImageView(icon: "minus.magnifyingglass")
                    }
                    //Reset
                    Button{
                        resetImageSate()
                    }label: {
                        ControllImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                    }
                    //Scale up
                    Button{
                        withAnimation(.spring()) {
                            if imageScale < 5 {
                                imageScale += 1
                                if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        }
                    }label: {
                        ControllImageView(icon: "plus.magnifyingglass")
                    }
                }//: CONTROLLERS
                    .padding(EdgeInsets(top: 12, leading: 20, bottom:12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimation ? 1 : 0)
                
                    ,alignment: .bottom
                    )
            //MARK: USER DRAWER
            .overlay(
                HStack {
                    Image(systemName: "chevron.compact.\(drawerIcon)")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .foregroundColor(.secondary)
                        .padding(8)
                        .onTapGesture(count: 1, perform: {
                            withAnimation(.linear){
                                isDrawenOpened.toggle()
                                if drawerIcon == "left"{
                                    drawerIcon = "right"
                                }else {
                                    drawerIcon = "left"
                                }
                            }
                        })
                    Spacer()
                }//:: DRAWER
                    .padding(EdgeInsets(top: 16, leading: 8, bottom:16, trailing: 8))
                
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .frame(width: 260)
                    .padding(.top , UIScreen.main.bounds.height/12)
                    .opacity(isAnimation ? 1 : 0)
                    .offset(x: isDrawenOpened ? 20 : 215)
            
                ,alignment: .topTrailing
              
                    
            )
            
             
        }//:NAGIGATON
        .navigationViewStyle(.stack)
     
    }
}


//MARK: PREVIEW
#Preview {
    ContentView()
}
