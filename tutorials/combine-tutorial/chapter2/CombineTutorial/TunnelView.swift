//
//  TunnelView.swift
//  CombineTutorial
//
//  Created by kevin.cheng on 9/24/19.
//  Copyright © 2019 Kevin-Cheng. All rights reserved.
//

import SwiftUI

struct TunnelView: View {
    
    @Binding var streamValues: [String]
    
    let verticalPadding: CGFloat = 5
     
    let tunnelColor: Color = Color(red: 242/255.0, green: 242/255.0, blue: 242/255.0)
    
    var body: some View {
        HStack(spacing: verticalPadding) {
            ForEach(streamValues.reversed(), id: \.self) { value in
                CircularTextView(text: value)                    
            }
        }.padding(.horizontal, 5).padding(.vertical, 5)
        .frame(maxWidth: .infinity, minHeight: 60, alignment: .trailing)
        .padding([.top, .bottom], verticalPadding)
        .background(tunnelColor)
    }
}

struct TunnelView_Previews: PreviewProvider {
    static var previews: some View {
        Section {
            TunnelView(streamValues: .constant(["1"]))
            TunnelView(streamValues: .constant(["1", "2"]))
            TunnelView(streamValues: .constant(["1", "2", "3"]))
        }.previewLayout(.sizeThatFits)
    }
}
