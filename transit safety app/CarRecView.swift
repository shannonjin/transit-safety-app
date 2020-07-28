//
//  CarRecView.swift
//  transit safety app
//
//  Created by Shannon Jin on 7/27/20.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//


import SwiftUI

struct CarRecView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        
        ZStack{
            
            
            Image("safe_car").resizable().onTapGesture {
                self.viewRouter.currentPage = "map result"
            }.frame(width: 377.0, height: 560.0)
                    //667.0
         .offset(y: -10)
        }
    }
}

struct CarRecView_Previews: PreviewProvider {
    static var previews: some View{
        CarRecView(viewRouter: ViewRouter())
    }
}
