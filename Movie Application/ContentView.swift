//
//  ContentView.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 21.12.22.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView{
                MovieTabView()
                    .tabItem() {
                        Image(systemName: "film")
                        Text("Movies")
                    }
                SeriesTabView()
                    .tabItem() {
                        Image(systemName: "film.stack")
                        Text("Series")
                    }
                PeopleTabView()
                    .tabItem() {
                        Image(systemName: "person.fill")
                        Text("Artists")
                    }
            }.navigationTitle("Movie Application")
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
