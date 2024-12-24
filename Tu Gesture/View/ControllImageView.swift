//
//  ControllImageView.swift
//  Tu Gesture
//
//  Created by Ahmed El Gndy on 24/12/2024.
//

import SwiftUI

struct ControllImageView: View {
    let icon : String
    var body: some View {
        Image(systemName:icon)
            .font(.system(size: 36))
    }
}


struct Preview_ControllImageView : PreviewProvider {
    static var previews: some View {
        ControllImageView(icon: "minus.magnifyingglass")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
 
  
