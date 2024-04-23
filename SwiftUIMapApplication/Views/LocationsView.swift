//
//  LocationsView.swift
//  SwiftUIMapApplication
//
//  Created by Jagadish Paul on 19/04/24.
//

import SwiftUI
import MapKit
import Foundation


struct LocationsView: View {
//    @StateObject private var vm = LocationsViewModel()
    @EnvironmentObject private var vm :LocationsViewModel
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            VStack(spacing:0){
               header
                .padding()
               Spacer()
                ZStack{
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location{
                            LocationPreviewView(location: location)
                                .shadow(color:Color.black.opacity(0.3),radius: 20)
                                .padding()
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                        
                    }
                }
                
            }
            
        }
       
    }
}
extension LocationsView{
    private var header :some View{
        VStack {
            Button {
                vm.toggleLocationList()
            } label: {
                Text(vm.mapLocation.name + "," + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height:55)
                    .frame(maxWidth:.infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .padding()
                            .foregroundColor(.primary)
                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                    }
            }
            if vm.showLocationList{
                LocationsListView()
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color:Color.black.opacity(0.3),radius: 20,x:0,y:20)
        
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
