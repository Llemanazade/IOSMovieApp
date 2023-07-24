//
//  PeopleTabView.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 21.12.22.
//

import SwiftUI

struct PeopleTabView: View {
    @ObservedObject private var peopleState = PeopleListState()
    
    var body: some View {
        NavigationView {
            VStack{
                if !self.peopleState.trendingPeople.isEmpty {
                    ScrollView(.horizontal){
                        HStack{
                            TrendingPeople(people: self.peopleState.trendingPeople)
                        }
                    }
                    
                    
                }
                else{
                    LoadingStateView(isLoading: self.peopleState.isLoading, error: self.peopleState.error) {
                        self.peopleState.loadPeople(with: .trending)
                    }
                }
                
                
                if !self.peopleState.popularPeople.isEmpty {
                    ScrollView{
                        LazyVStack{
                            PopularPeople(people: self.peopleState.popularPeople)
                            if (peopleState.currentPage < peopleState.totalPages){
                                ProgressView()
                                    .padding()
                                    .onAppear{
                                        self.peopleState.loadPeople(with: .popular)
                                    }
                            }
                        }
                    }
                    
                }
                else {
                    LoadingStateView(isLoading: self.peopleState.isLoading, error: self.peopleState.error) {
                        self.peopleState.loadPeople(with: .popular)
                    }
                    
                }
                
                
            }.onAppear{
                self.peopleState.loadPeople(with: .trending)
                self.peopleState.loadPeople(with: .popular)
            }
        }
    }
}

struct PeopleTabView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleTabView()
    }
}
