//
//  ArtistMovieCredits.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 26.12.22.
//

import SwiftUI

struct ArtistMovieCredits: View {
    let movie: PersonMovieCast
    var body: some View {
        HStack{
            if(movie.posterPath != nil){
                AsyncImage(
                    url: movie.posterUrl) { image in
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
                Text(self.movie.title)
                    .font(.system(size: 20))
                    .lineLimit(2)
                    .foregroundColor(.white)
                    .frame(width: 100)
                
                Label(self.movie.character ?? "", systemImage: "dot.square")
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



