//
//  PeopleDetails.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 21.12.22.
//

import SwiftUI

struct PeopleDetails: View {
    let id: Int
    @ObservedObject var personDetails = PersonDetailsState()
    
    var body: some View {ZStack{
        
        LoadingStateView(isLoading: self.personDetails.isLoading, error: self.personDetails.error) {
            self.personDetails.loadPerson(id: self.id)
        }
        if self.personDetails.person != nil {
            
            PeopleDetailsView(person: self.personDetails.person!)
        }
    }.onAppear{
        self.personDetails.loadPerson(id: self.id)
    }
    }
}


struct PeopleDetailsView: View {
    
    let person: People
    
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 15 ){
                if(person.profilePath != nil) {
                    AsyncImage(
                        url: person.profileUrl) { image in
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
                
                
                Text(person.name)
                    .font(.system(size: 30, weight: .heavy,
                                  design: .monospaced))
                
                Text("Known for: Actor")
                    .font(.system(size:20,
                                  weight: .light ,
                                  design:.monospaced))
                    .lineLimit(2)
                if(person.biography != nil){
                    Text(person.biography!)
                        .font(.system(size: 20,
                                      weight: .light,
                                      design: .monospaced))
                }
                
                Text("movies")
                ScrollView(.horizontal){
                    HStack(){
                        if(person.movieCast != nil) {
                            ForEach(person.movieCast!){ item in
                                NavigationLink(destination: MovieDetails(id: item.id)){
                                    ArtistMovieCredits(movie: item)
                                }
                            }
                        }
                        
                    }
                }
                Text("series")
                ScrollView(.horizontal){
                    HStack(){
                        if(person.serieCast != nil) {
                            ForEach(person.serieCast!){item in
                                NavigationLink(destination: SerieDetails(id: item.id)){
                                    ArtistSerieCredits(serie: item)
                                }
                            }
                        }
                        
                        
                        
                        
                    }
                }
            }
        }
    }
}
