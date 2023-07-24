//
//  SeriesTabView.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 21.12.22.
//

import SwiftUI

struct SeriesTabView: View {
    @ObservedObject private var serieState = SerieListState()
    var body: some View {
        NavigationView {
            VStack{
                if !self.serieState.topSeries.isEmpty {
                    ScrollView(.horizontal){
                        HStack(){
                            TopRatedSeries(series: self.serieState.topSeries)
                        }
                    }
                }
                else {
                    LoadingStateView(isLoading: self.serieState.isLoading, error: self.serieState.error) {
                        self.serieState.loadSeries(with: .topRated)
                    }
                }
                if !self.serieState.popularSeries.isEmpty {
                    ScrollView{
                        LazyVStack(){
                            PopularSeries(series: self.serieState.popularSeries)
                            if (serieState.currentPage < serieState.totalPages){
                                ProgressView()
                                    .padding()
                                    .onAppear{
                                        self.serieState.loadSeries(with: .popular)
                                    }
                            }
                        }
                    }
                    
                }
                else {
                    LoadingStateView(isLoading: self.serieState.isLoading, error: self.serieState.error) {
                        self.serieState.loadSeries(with: .popular)
                    }
                }
            }
        }.onAppear{
            self.serieState.loadSeries(with: .topRated)
            self.serieState.loadSeries(with: .popular)
        }
    }
}
