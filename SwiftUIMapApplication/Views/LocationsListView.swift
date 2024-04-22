//
//  LocationsListView.swift
//  SwiftUIMapApplication
//
//  Created by MSS on 22/04/24.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm :LocationsViewModel
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                Button(action: {
                    print("Tapppp\(location.name)")
                    vm.showNextLocation(location: location)
                }, label: {
                    listRowView(location: location)
                }).padding(.vertical,2)
                  .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
        
    }
}
extension LocationsListView{
    private func listRowView(location:Location) -> some View{
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45,height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment:.leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
                
            }
            .frame(maxWidth:.infinity,alignment: .leading)
           // .background(Color.red)
        }
    }
}
#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
