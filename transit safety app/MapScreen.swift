//
//  MapScreen.swift
//  transit safety app
//
//  Created by Oliver Harman on 19/07/2020.
//  Copyright © 2020 Shannon Jin. All rights reserved.
//

import SwiftUI
import MapKit



struct MapScreen: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @State private var start = "Times Sq-42 St"
    var body: some View {
                
        ZStack{
            
            Image("MenuBar").resizable().onTapGesture {
                self.viewRouter.currentPage = "login"
            }.frame(width: 377.0, height: 200)
            .offset(y:-244)
            
            TextField("From", text:  $start)
                .offset(x:76,y:-226)
            
            TextField("To", text:  /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).offset(x:76, y:-268)
            
            MapView().frame(width: 377.0, height: 400, alignment: .center)
            
            goButton().onTapGesture {
                self.viewRouter.currentPage = "map result"
            }
            
            graphButton().onTapGesture {
                self.viewRouter.currentPage = "monday"
            }

            
            tabButton().onTapGesture {
               if let url = URL(string: "https://public.tableau.com/profile/kathy.lin1766#!/vizhome/stationdensitytry2/Dashboard1?publish=yes") {
                   UIApplication.shared.open(url)
               }
            }
        }
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen(viewRouter: ViewRouter())
    }
}

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
         MKMapView(frame: .zero)
    }
    
    // 2.
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        // 3.
        let location = CLLocationCoordinate2D(latitude: 40.7580, longitude: -73.9855)
        //(latitude: 40.759011, longitude: -73.984472) A little to the side of grand centrsl
        
        // 4.
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        uiView.setRegion(region, animated: true)
        
        // 5.
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Times Square"
        //annotation.subtitle = "London"
        uiView.addAnnotation(annotation)
        
    }
}

struct goButton : View{
      var body: some View {
          return Text("Find Safest Path")
              .foregroundColor(.white)
              .frame(width: 300, height: 30)
              .background(Color.blue)
              .cornerRadius(15)
              .padding(.top, 50)
              .font(.system(size:13))
              .position(x:185, y:530)
      }
  }


struct tabButton : View{
    var body: some View {
        return Text("See hourly subway station density map")
            .foregroundColor(.white)
            .frame(width: 300, height: 30)
            .background(Color.blue)
            .cornerRadius(15)
            .padding(.top, 50)
            .font(.system(size:13))
            .position(x:185, y:580)
    }
}

struct graphButton : View{
    var body: some View {
        return Text("See historical station density")
            .foregroundColor(.blue)
            .frame(width: 250, height: 30)
            .background(Color.white)
            .cornerRadius(15)
            .padding(.top, 50)
            .font(.system(size:13))
            .position(x:240, y:130)
    }
}

  
