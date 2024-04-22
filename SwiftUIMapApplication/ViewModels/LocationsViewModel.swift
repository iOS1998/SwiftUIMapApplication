//
//  LocationsViewModel.swift
//  SwiftUIMapApplication
//
//  Created by MSS on 19/04/24.
//

import Foundation
import MapKit
import SwiftUI


class LocationsViewModel:ObservableObject{
    @Published var locations:[Location]
    @Published var mapLocation:Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion:MKCoordinateRegion = MKCoordinateRegion()
    let mapSpam = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocationList:Bool = false
    
    init() {
        let location = LocationsDataService.locations
        self.locations = location
        self.mapLocation = location.first!
        self.updateMapRegion(location:location.first!)
    }
    private func updateMapRegion(location:Location){
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span:mapSpam)
        }
    }
    func toggleLocationList(){
        withAnimation(.easeInOut) {
            showLocationList = !showLocationList
        }
    }
    func showNextLocation(location:Location){
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationList = false
        }
    }
}
