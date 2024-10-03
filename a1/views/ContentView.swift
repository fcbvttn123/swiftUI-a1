//
//  ContentView.swift
//  a1
//
//  Created by David Vu on 2024-10-02.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: Subpage1View()) {
                    Text("Subpage 1")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding(20)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(20)
                NavigationLink(destination: Subpage2View()) {
                    Text("Subpage 2")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding(20)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(20)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
