//
//  lastMondaay.swift
//  transit safety app
//
//  Created by Shannon Jin on 7/27/20.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//



import SwiftUI

struct MondayView: View {
    
    @ObservedObject var viewRouter: ViewRouter
 
    
    var body: some View {
        
        ZStack{
            Image("white_x").scaleEffect(0.2).position(x:50, y:30).onTapGesture {
                        self.viewRouter.currentPage = "map screen"
            }
            Image("monday").resizable()
                .frame(width: 377.0, height: 377.0)
                .offset(y: -10)
            
        }.background(Color.black)
      
    }
}

