//
//  ContentView.swift
//  PokeAPI
//
//  Created by Robert Sandru on 27.10.2022.
//

import SwiftUI
import PokeAPI_Lib

struct ContentView: View {
    
    @State var paginatedResults: PaginatedResult<PokemonSnapshot> = PaginatedResult.emptyPage
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(paginatedResults.results, id:\.self) { pokemon in
                    VStack(alignment: .leading) {
                        Text(pokemon.name)
                        Text(pokemon.url)
                    }
                    .padding(.bottom)
                }
            }
        }
        .padding()
        .onAppear {
            let service: PokemonRestService = PokemonRestService()
            let task = Task {
                let result = await service.getPokemonPaginated(offset:10, limit: 10)
                switch result {
                case .success(let success):
                    self.paginatedResults = success
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
