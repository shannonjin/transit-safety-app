//
//  ContentView.swift
//  transit safety app
//
//  Created by Shannon Jin on 7/7/20.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    @State var startAddress: String = ""
    @State var destinationAddress: String = ""
    
    var body: some View {
        
        ZStack{
            
            Image("MainBackGround (3)").resizable()
                .frame(width: 377.0, height: 667.0)
                .offset(y: -10)
            
            SecureField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .font(.system(size:16))
                .offset(x:75, y:73)
                
            
            TextField("Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .font(.system(size:16))
                .offset(x:75, y:28)
            
            Button(action: {}){
                Text("Forgot Password")
                    .font(.system(size:10))
                    .offset(x:70, y:73)
                    .foregroundColor(Color.gray)
            }
            
            ZStack{
                
               /* Capsule()
                    .size(width: 220, height: 24)
                    .offset(x:76, y:453)
                    .fill(Color.init(red: 0, green:0.22, blue:0.65))
                    .shadow(radius: 3)*/
                
                LoginButtonContent().onTapGesture {
                    self.viewRouter.currentPage = "map screen"
                }
            }
            
            ZStack{
                /*Capsule()
                    .size(width: 100, height: 24)
                    .offset(x:137,y:488)
                    .fill(Color.white)
                    .shadow(radius:3)
                .overlay(
                    Capsule()
                        .stroke(Color.black,lineWidth:1)
                    )
                    .frame(width:100,height:24)
                    .offset(x:0,y:165)
                    .shadow(radius: 3)*/
                
        
                SignupButtonContent().onTapGesture {
                    self.viewRouter.currentPage = "create account"
                }
            }
            
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}


struct SignupButtonContent : View{
    var body: some View {
        return Text("Sign Up")
            .foregroundColor(.white)
            .frame(width: 200, height: 30)
            .background(Color.init(red: 0, green: 0.22, blue: 0.65, opacity: 1))
            .cornerRadius(15)
            .padding(.top, 50)
            .font(.system(size:13))
            .position(x:190, y:450)
    }
}


struct LoginButtonContent : View{
    var body: some View {
        return Text("Login")
            .foregroundColor(.white)
            .frame(width: 200, height: 30)
            .background(Color.init(red: 0, green: 0.22, blue: 0.65, opacity: 1))
            .cornerRadius(15)
            .padding(.top, 50)
            .font(.system(size:13))
            .position(x:190, y:490)
    }
}
