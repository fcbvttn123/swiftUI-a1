//
//  Subpage1View.swift
//  a1
//
//  Created by David Vu on 2024-10-02.
//

import SwiftUI

struct AvtButton : ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct Subpage1View: View {
    
    // Form Value
    @State private var name = ""
    @State private var address = ""
    @State private var email = ""
    @State private var age = 0
    @State private var avt = "messi"
    
    // Alert Setup
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                Form {
                    // Text Fields
                    TextField("Name", text: $name)
                    TextField("Address", text: $address)
                    TextField("Email", text: $email)
                    TextField("Age", value: $age, format: .number).keyboardType(.numberPad)
                    // Avatar Buttons
                    HStack {
                        Button("Avatar 1")  {
                            avt = "neymar"
                            print("You picked avatar 1")
                        }.buttonStyle(AvtButton())
                        Button("Avatar 2")  {
                            avt = "messi"
                            print("You picked avatar 2")
                        }.buttonStyle(AvtButton())
                        Button("Avatar 3")  {
                            avt = "suarez"
                            print("You picked avatar 3")
                        }.buttonStyle(AvtButton())
                    }
                    // Submit Button
                    Button(action: {
                        if name.isEmpty || address.isEmpty || email.isEmpty || age <= 0 {
                            alertTitle = "Error!"
                            alertMessage = "Please fill in all the fields"
                        } else {
                            addProfile()
                            alertTitle = "Form Submitted!"
                            alertMessage = "Thank you \(name) for your submission"
                            print("Form Submitted")
                        }
                        showingAlert = true
                    }){
                        Text("Submit")
                    }
                }
                .navigationTitle("My Form")
            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text(alertTitle),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("Got it!"))
                )
            }
        }
        
    }
    
    func addProfile() {
        let table = PersistenceController.shared
        table.saveProfile(name: name, address: address, email: email, age: "\(age)", avt: avt)
    }
    
}

#Preview {
    Subpage1View()
}
