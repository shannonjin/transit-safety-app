//
//  MotherView.swift
//  transit safety app
//
//  Created by Shannon Jin on 7/25/20.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//

import SwiftUI

struct MotherView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            if viewRouter.currentPage == "login"
            {
                ContentView(viewRouter: viewRouter)
            } else if viewRouter.currentPage == "map screen"
            {
                MapScreen(viewRouter: viewRouter)
            }
            else if viewRouter.currentPage == "create account"
            {
                CreateAccount(viewRouter: viewRouter)
            }
            else if viewRouter.currentPage == "map result"
            {
                MapResult(viewRouter: viewRouter)
            }
        }
    }
}

struct MotherView_Previews: PreviewProvider {
    static var previews: some View {
        MotherView(viewRouter: ViewRouter())
    }
}
