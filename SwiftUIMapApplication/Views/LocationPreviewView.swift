//
//  LocationPreviewView.swift
//  SwiftUIMapApplication
//
//  Created by Jagadish Paul on 22/04/24.
//

import SwiftUI

struct LocationPreviewView: View {
    let location:Location
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            VStack{
                learnMorebutton
                nextbutton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .cornerRadius(10)
        
    }
}
extension LocationPreviewView{
    private var imageSection:some View{
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    private var titleSection:some View{
        
        VStack(alignment: .leading, spacing: 4.0) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.title3)
        }
        .frame(maxWidth:.infinity,alignment: .leading)
    }
    private var learnMorebutton:some View{
        Button{
            
        }label: {
            Text("Learn more")
                .font(.headline)
                .foregroundColor(Color.white)
               
        }
        .frame(width: 120, height: 35)
        .background(Color.red)
        .cornerRadius(6)
    }
    private var nextbutton:some View{
        Button{
            
        }label: {
            Text("Next")
                .font(.headline)
                .foregroundColor(Color.white)
               
        }
        .frame(width: 120, height: 35)
        .background(Color.red)
        .cornerRadius(6)
    }
}

#Preview {
    LocationPreviewView(location: LocationsDataService.locations.first!)
}
