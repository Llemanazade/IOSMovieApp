//
//  MovieDetails.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 21.12.22.
//

import SwiftUI

struct MovieDetails: View {
    let id: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    var body: some View {
        ZStack{
            LoadingStateView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.id)
            }
            if movieDetailState.movie != nil {
                MovieDetailsView(movie: self.movieDetailState.movie!)
            }
        }.onAppear{
            self.movieDetailState.loadMovie(id: id)
        }
    }
}


struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails(id: 5)
    }
}

struct MovieDetailsView: View {
    let movie: Movie
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .center, spacing: 15 ){
                    
                    if (movie.posterPath != nil) {
                        AsyncImage(
                            url: movie.posterURL) { image in
                                image.resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(maxWidth: 250, maxHeight: 300)
                                    .cornerRadius(20)
                                    .padding(5)
                                
                            }
                    placeholder: {
                        Color.gray
                    }.frame(maxWidth: 250, maxHeight: 300)
                    }
                    else{
                        Image("BlankProfile")
                            .resizable()
                            .frame(width: 250, height: 300)
                            .cornerRadius(20)
                            .padding(5)
                        
                    }
                    
                    Text(self.movie.title)
                        .font(.system(size: 30, weight: .heavy,
                                      design: .monospaced))
                    
                    Text(self.movie.genreText)
                        .font(.system(size:20,
                                      weight: .light ,
                                      design:.monospaced     ))
                        .lineLimit(2)
                    
                    Text(self.movie.overview)
                        .font(.system(size: 20,
                                      weight: .light,
                                      design: .monospaced))
                    
                }
            }
            ScrollView(.horizontal){
                HStack(){
                    ForEach(self.movie.cast!){ item in
                        NavigationLink(destination: PeopleDetails(id: item.id)){
                            MovieArtistCreditsView(cast: item)
                        }
                    }
                }
            }
            .padding(10)
        }
        
    }
}


