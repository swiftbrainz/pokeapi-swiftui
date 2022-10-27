//
//  ContentView.swift
//  PokeAPI
//
//  Created by Robert Sandru on 27.10.2022.
//

import SwiftUI
import PokeAPI_Lib

struct ContentView: View {
    
    let service: PokemonRestService = PokemonRestService()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
