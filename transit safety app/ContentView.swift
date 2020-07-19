//
//  ContentView.swift
//  transit safety app
//
//  Created by Shannon Jin on 7/7/20.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var startAddress: String = ""
    @State var destinationAddress: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading){
            TextField("Frick", text: $startAddress)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("To", text: $destinationAddress)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }.padding()
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
