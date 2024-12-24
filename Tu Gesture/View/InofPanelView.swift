//
//  InofPanelView.swift
//  Tu Gesture
//
//  Created by Ahmed El Gndy on 24/12/2024.
//

import SwiftUI

struct InofPanelView: View {
    var scale: CGFloat
    var offset : CGSize
    //MARK: FUNCTIONS

    @State private var isInofPanelVisisbel : Bool = false
    var body: some View {
        //MARK - HOTSPOT
        HStack {
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30 , height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeIn){
                        isInofPanelVisisbel.toggle()
                    }
                }
            Spacer()
            HStack(spacing: 2 ) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                Spacer()
            }//: HSTACk
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 400)
            .opacity(isInofPanelVisisbel ? 1 : 0)
        Spacer()
        }//: HSTACk
    }
}

struct Preview : PreviewProvider {
    static var previews: some View {
        InofPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
 
  

