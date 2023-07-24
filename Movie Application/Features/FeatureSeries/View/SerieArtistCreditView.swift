//
//  SerieArtistCreditView.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import SwiftUI

struct SerieArtistCreditView: View {
    let cast: SerieCast
    var body: some View {
        HStack{
            if(cast.profilePath != nil){
                AsyncImage(
                    url: cast.profileURL) { image in
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
                    .scaledToFit()
                    .frame(width: 75, height: 125)
                    .cornerRadius(20)
                    .padding(5)
            }
            
            
            VStack(alignment: .leading, spacing: 7) {
                Text(self.cast.name)
                    .font(.system(size: 20))
                    .lineLimit(2)
                    .foregroundColor(.white)
                    .frame(width: 100)
                
                Label(self.cast.character, systemImage: "dot.square")
                    .font(.system(size: 15))
                    .frame(width: 100)
                    .lineLimit(2)
                    .foregroundColor(.yellow)
                
            }.padding()
        }.background(Color.black)
            .cornerRadius(20)
            .scaledToFill()
    }
}

