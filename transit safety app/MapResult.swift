//
//  MapResult.swift
//  transit safety app
//
//  Created by Shannon Jin on 7/27/20.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//


import SwiftUI
import MapKit


struct MapResult: View {

     @ObservedObject var viewRouter: ViewRouter
    @State private var start = "Grand Central Station"
     @State private var end = "Columbia University"

    
    var body: some View {
                
        ZStack{
            
            Image("MenuBar").resizable()
                .frame(width: 377.0, height: 200)
                .offset(y:-244)
            
            TextField("From", text: $start)
                .offset(x:76,y:-226)
            
            TextField("To", text: $end).offset(x:76, y:-268)
            
            Image("route").resizable().frame(width: 377.0, height: 400)
            
            clearButton().onTapGesture{
                self.viewRouter.currentPage = "map screen"
            }
            
            tabButton().onTapGesture {
                if let url = URL(string: "https://public.tableau.com/profile/kathy.lin1766#!/vizhome/stationdensitytry2/Dashboard1?publish=yes") {
                    UIApplication.shared.open(url)
                }
            }
            
  

        }
    }
}

struct MapResult_Previews: PreviewProvider {
    static var previews: some View {
        MapResult(viewRouter: ViewRouter())
    }
}

struct clearButton : View{
    var body: some View {
        return Text("Reset Map")
            .foregroundColor(.white)
            .frame(width: 200, height: 30)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
            .font(.system(size:13))
            .position(x:185, y:520)
    }
}





  
  


