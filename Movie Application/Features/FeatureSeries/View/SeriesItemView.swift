//
//  SeriesItemView.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 21.12.22.
//

import SwiftUI

struct SeriesItemView: View {
    let serie: Serie
    var body: some View {
        HStack{
            if(serie.posterPath != nil) {
                AsyncImage(
                    url: serie.posterURL){image in
                        image.resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxWidth: 120, maxHeight: 170)
                            .cornerRadius(20)
                            .padding(5)
                        
                    }
            placeholder: {
                Color.gray
            }.frame(maxWidth: 120, maxHeight: 170)
            }
            else {
                Image("BlankProfile")
                    .resizable()
                    .frame(width: 120, height: 170)
                    .cornerRadius(20)
                    .padding(5)
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text(self.serie.name)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .foregroundColor(.white)
                    .frame(width: 200)
                
                Label(self.serie.scoreText, systemImage: "star.fill")
                    .font(.subheadline)
                    .foregroundColor(.yellow)
                
                Label("en-US", systemImage: "network")
                    .font(.subheadline)
                    .foregroundColor(.yellow)
                
                Label(self.serie.yearText, systemImage: "calendar")
                    .font(.subheadline)
                    .foregroundColor(.yellow)
            }.padding()
        }.background(Color.black)
            .cornerRadius(20)
            .scaledToFill()
        
    }
}

