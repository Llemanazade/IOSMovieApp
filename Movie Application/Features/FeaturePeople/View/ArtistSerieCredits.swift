//
//  ArtistSerieCredits.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 26.12.22.
//

import SwiftUI

struct ArtistSerieCredits: View {
    let serie: PersonSerieCast
    var body: some View {
        HStack{
            if(serie.posterPath != nil){
                AsyncImage(
                    url: serie.posterUrl) { image in
                        image.resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxWidth: 75, maxHeight: 125)
                            .cornerRadius(20)
                            .padding(5)
                        
                    } placeholder: {
                        Color.gray
                    }.frame(maxWidth: 75, maxHeight: 125)
            }
            else {
                Image("BlankProfile")
                    .resizable()
                    .frame(width: 75, height: 125)
                    .cornerRadius(20)
                    .padding(5)
            }
            
            
            VStack(alignment: .leading, spacing: 7) {
                Text(self.serie.name)
                    .font(.system(size: 20))
                    .lineLimit(2)
                    .foregroundColor(.white)
                    .frame(width: 100)
                
                Label(self.serie.character ?? "", systemImage: "dot.square")
                    .font(.system(size: 15))
                    .foregroundColor(.yellow)
                    .frame(width: 100)
                    .lineLimit(2)
                
            }.padding()
        }.background(Color.black)
            .cornerRadius(20)
            .scaledToFill()
        
    }
}



