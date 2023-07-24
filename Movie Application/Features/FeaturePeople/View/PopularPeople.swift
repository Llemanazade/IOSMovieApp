//
//  PopularPeople.swift
//  Movie Application
//
//  Created by Laman Akhundzade on 23.12.22.
//

import SwiftUI

struct PopularPeople: View {
    let people: [People]
    var body: some View {
        
        ForEach(self.people){ item in
            NavigationLink(destination: PeopleDetails(id: item.id)){
                PeopleItemView(actor: item)
            }
        }
    }
}


