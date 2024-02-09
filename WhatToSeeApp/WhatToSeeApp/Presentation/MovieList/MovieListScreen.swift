//
//  ContentView.swift
//  WhatToSeeApp
//
//  Created by Hiram Castro on 08/02/24.
//

import SwiftUI

struct MovieListScreen: View {
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            Text("Movies")
        }
        .listStyle(.plain)
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Add Movie") {
            isPresented = true
        })
        .sheet(isPresented: $isPresented, content: {
            AddMovieScreen()
        })
        .embedInNavigationView()
        .onAppear(perform: {
            
        })
    }
}

#Preview {
    MovieListScreen()
}
