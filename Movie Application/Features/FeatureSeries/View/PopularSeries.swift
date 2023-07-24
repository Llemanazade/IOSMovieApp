//
//  PopularSeries.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import SwiftUI

struct PopularSeries: View {
    let series: [Serie]
    var body: some View {
        
        ForEach(self.series){ item in
            NavigationLink(destination: SerieDetails(id: item.id)){
                SeriesItemView(serie: item)
            }
        }
        
    }
}

