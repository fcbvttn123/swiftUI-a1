//
//  Subpage2View.swift
//  a1
//
//  Created by David Vu on 2024-10-02.
//

import SwiftUI

struct Data : Identifiable {
    var id = UUID()
    var name : String
    var address : String
    var email : String
    var age : String
    var avt : String
}

struct ListRow : View {
    var data : Data
    var body: some View {
        HStack {
            Image(data.avt).renderingMode(.original).frame(width: 45, height: 45, alignment: .center).padding(20)
            VStack {
                Text(data.name)
                Text(data.address)
                Text(data.email)
                Text("\(data.age)")
            }
        }
    }
}

struct Subpage2View: View {
    
    @State private var showingAlert = false
    
    @Environment(\.managedObjectContext) var context
            
    @FetchRequest(
        entity: Profiles.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Profiles.name, ascending: true)]
    ) var profiles : FetchedResults<Profiles>
    
    var body: some View {
        List(profiles, id: \.self) { profile in
            let data = Data(
                name: profile.name ?? "Unknown",
                address: profile.address ?? "No Address",
                email: profile.email ?? "No Email",
                age: "\(profile.age)",
                avt: profile.avt ?? "messi"
            )
            ListRow(data: data)
                .swipeActions(edge: .trailing) {
                    Button {
                        context.delete(profile)
                        try? context.save()
                        showingAlert = true
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }.tint(.red)
                }
        }
        .alert(isPresented: $showingAlert) {
            Alert(
                title: Text("Deleted!"),
                message: Text("This profile is deleted."),
                dismissButton: .default(Text("Back"))
            )
        }
    }
    
}

#Preview {
    Subpage2View()
}
