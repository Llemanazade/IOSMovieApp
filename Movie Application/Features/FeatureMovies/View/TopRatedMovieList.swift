//
//  TopRatedMovieList.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import SwiftUI

struct TopRatedMovieList: View {
    let movie: [Movie]
    var body: some View {
        
        
        ForEach(self.movie){ item in
            NavigationLink(destination: MovieDetails(id: item.id)) {
                MovieItemView(movie: item)
                    .padding()
            }
        }
    }
    
}


