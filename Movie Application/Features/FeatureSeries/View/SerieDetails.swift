//
//  SerieDetails.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 21.12.22.
//

import SwiftUI

struct SerieDetails: View {
    let id: Int
    @ObservedObject var serieDetails = SerieDetailState()
    var body: some View {
        ZStack{
            LoadingStateView(isLoading: self.serieDetails.isLoading, error: self.serieDetails.error) {
                self.serieDetails.loadSerie(id: self.id)
            }
            if self.serieDetails.serie != nil {
                
                SerieDetailsView(serie: self.serieDetails.serie!)
            }
        }.onAppear{
            self.serieDetails.loadSerie(id: self.id)
        }
    }
    
    
    struct SerieDetailsView: View {
        let serie: Serie
        var body: some View {
            ScrollView{
                VStack(alignment: .center, spacing: 15 ){
                    if (serie.posterPath != nil) {
                        AsyncImage(
                            url: serie.posterURL) { image in
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
                    
                    Text(self.serie.name)
                        .font(.system(size: 30, weight: .heavy,
                                      design: .monospaced))
                    
                    Text(self.serie.genreText)
                        .font(.system(size:20,
                                      weight: .light ,
                                      design:.monospaced     ))
                        .lineLimit(2)
                    
                    Text(self.serie.overview)
                        .font(.system(size: 20,
                                      weight: .light,
                                      design: .monospaced))
                    ScrollView(.horizontal){
                        HStack(){
                            ForEach(self.serie.cast!){ item in
                                NavigationLink(destination: PeopleDetails(id: item.id)){
                                    SerieArtistCreditView(cast: item)
                                }
                            }
                        }
                    }
                }
                .padding(10)
            }
        }
    }
}
