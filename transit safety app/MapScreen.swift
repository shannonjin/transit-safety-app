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
    @State var input: String = ""

    
    var body: some View {
        ZStack{
            Image("MenuBar").resizable()
                .frame(width: 377.0, height: 200)
                .offset(y:-244)
            
            TextField("From", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .offset(x:76,y:-226)
            
            TextField("To", text: $input,onCommit: {
            }).offset(x:76, y:-268)
            
            
            
            
            MapView().frame(width: 377.0, height: 400, alignment: .center)
            
            
        }
    }
}

struct MapScreen_Previews: PreviewProvider {
    static var previews: some View {
        MapScreen(viewRouter: ViewRouter())
    }
}

struct MapView: UIViewRepresentable {
    
    @Binding var dest: String
    // 1.
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // 2.
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        // 3.
        let location = CLLocationCoordinate2D(latitude: 40.7527, longitude: -73.9772)
        
        
        //(latitude: 40.759011, longitude: -73.984472) A little to the side of grand centrsl
        
        // 4.
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        uiView.setRegion(region, animated: true)
        
        // 5.
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Grand Central Station"
        //annotation.subtitle = "London"
        uiView.addAnnotation(annotation)
        
        if(dest != ""){
            
            let destinationLocation = CLLocationCoordinate2D(latitude: 40.748441, longitude: -73.985564)
            let sourceLocation = CLLocationCoordinate2D(latitude: 40.7527, longitude: -73.9772)
            
            let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
            let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
            
            
            // 4.
            let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
            let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
            
            // 5.
            let sourceAnnotation = MKPointAnnotation()
            sourceAnnotation.title = "Times Square"
            
            if let location = sourcePlacemark.location {
                sourceAnnotation.coordinate = location.coordinate
            }
            
            
            let destinationAnnotation = MKPointAnnotation()
            destinationAnnotation.title = "Empire State Building"
            
            if let location = destinationPlacemark.location {
                destinationAnnotation.coordinate = location.coordinate
            }
            
            // 6.
            uiView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
            
            
                 // 7.
            let directionRequest = MKDirections.Request()
                 directionRequest.source = sourceMapItem
                 directionRequest.destination = destinationMapItem
                 directionRequest.transportType = .automobile
                 
                 // Calculate the direction
                 let directions = MKDirections(request: directionRequest)
                 
                 // 8.
                 directions.calculate(completionHandler: ){
                     (response, error) -> Void in
                     
                     guard let response = response else {
                         if let error = error {
                             print("Error: \(error)")
                         }
                         
                         return
                     }
                     
                     let route = response.routes[0]
                     uiView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
                     
                     let rect = route.polyline.boundingMapRect
                    uiView.setRegion(MKCoordinateRegion.init(rect), animated: true)
                 }
            
            dest = ""
        }
    }
}
