//
//  CreateAccount.swift
//  transit safety app
//
//  Created by Oliver Harman on 19/07/2020.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//

import SwiftUI

struct CreateAccount: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
     ZStack{
                Image("CreateAccount1 (1)").resizable()
                    .frame(width: 290.0, height: 265.0)
                    .offset(y:-10)
        
        Image("x_out").scaleEffect(0.05).position(x:50, y:10).onTapGesture {
             self.viewRouter.currentPage = "login"
        }
        
                TextField("Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .offset(x:50 , y: 53)
                
                SecureField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .offset(x:50, y:108)
                
                SecureField("Confirm Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .offset(x:193, y:108)
                
                TextField("Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .offset(x:50, y:1)
                
                Capsule()
                    .size(width: 220, height: 24)
                    .offset(x:76, y:472)
                    .fill(Color.init(red: 0, green:0.22, blue:0.65))
                    .shadow(radius: 3)
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .font(.system(size:13))
                }
                .offset(y:160)
                
                
            }

        }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccount(viewRouter: ViewRouter())
    }
}
