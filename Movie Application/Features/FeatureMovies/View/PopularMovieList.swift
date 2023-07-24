//
//  PopularMovieList.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import SwiftUI

struct PopularMovieList: View {
    let movie: [Movie]
    var body: some View {
        
        
        ForEach(self.movie){ item in
            NavigationLink(destination: MovieDetails(id: item.id)) {
                MovieItemView(movie: item)
            }
        }
    }
}

struct PopularMovieList_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovieList(movie: Movie.stubbedMovies)
    }
}
