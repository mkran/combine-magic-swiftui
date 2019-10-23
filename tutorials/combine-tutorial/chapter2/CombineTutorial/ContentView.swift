//
//  ContentView.swift
//  CombineTutorial
//
//  Created by kevin.cheng on 9/24/19.
//  Copyright © 2019 Kevin-Cheng. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        CombineScanStreamView()        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}