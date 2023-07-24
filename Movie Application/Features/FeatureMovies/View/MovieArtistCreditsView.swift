//
//  ArtistCreditsView.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 21.12.22.
//

import SwiftUI
import Combine

struct MovieArtistCreditsView: View {
    let cast: MovieCast
    
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
                    .foregroundColor(.yellow)
                    .lineLimit(2)
                    .frame(width: 100)
                
            }
        }.background(Color.black)
            .cornerRadius(20)
        
    }
}

