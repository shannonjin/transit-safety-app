//
//  safetyTips.swift
//  transit safety app
//
//  Created by Shannon Jin on 7/27/20.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//

import SwiftUI

struct SafetyTipsView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        Image("SafetyTips").resizable().onTapGesture {
            self.viewRouter.currentPage = "map result"
        }.frame(width: 377.0, height: 667.0)
         .offset(y: -10)
    }
}

struct SafetyTipsView_Previews: PreviewProvider {
    static var previews: some View{
        SafetyTipsView(viewRouter: ViewRouter())
    }
}
