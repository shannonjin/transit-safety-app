//
//  MapScreen.swift
//  transit safety app
//
//  Created by Oliver Harman on 19/07/2020.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//

import SwiftUI

struct MapScreen: View {
    var body: some View {
        ZStack{
            Image("MenuBar").resizable()
                .frame(width: 377.0, height: 200)
                .offset(y:-244)
            
            TextField("From", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .offset(x:76,y:-226)
            
            TextField("To", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .offset(x:76, y:-268)
        }
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen()
    }
}
