//
//  MovieTabView.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 21.12.22.
//

import SwiftUI

struct MovieTabView: View {
    @ObservedObject private var movieState = MovieListState()
    
    var body: some View {
        
        NavigationView {
            VStack{
                if(!movieState.topMovies.isEmpty) {
                    ScrollView(.horizontal){
                        HStack(){
                            
                            TopRatedMovieList(movie: self.movieState.topMovies)
                        }
                    }
                }
                else {
                    LoadingStateView(isLoading: self.movieState.isLoading, error: self.movieState.error) {
                        self.movieState.loadMovies(with: .topRated)
                    }
                }
                
                if(!movieState.popularMovies.isEmpty) {
                    ScrollView{
                        LazyVStack{
                            PopularMovieList(movie: self.movieState.popularMovies)
                            if (movieState.currentPage < movieState.totalPages){
                                ProgressView()
                                    .padding()
                                    .onAppear{
                                        self.movieState.loadMovies(with: .popular)
                                    }
                            }
                        }
                    }
                }
                else {
                    LoadingStateView(isLoading: self.movieState.isLoading, error: self.movieState.error) {
                        self.movieState.loadMovies(with: .popular)
                    }
                }
                
            }.onAppear{
                self.movieState.loadMovies(with: .topRated)
                self.movieState.loadMovies(with: .popular)
            }
        }
    }
}

