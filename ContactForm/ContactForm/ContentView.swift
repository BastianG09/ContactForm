//
//  ContentView.swift
//  ContactForm
//
//  Created by BastianC on 6/24/22.
//

import SwiftUI

struct ContentView: View {
    @State private var emailAddress = ""
    @State private var phoneNumber = ""
    @State private var message = "Text goes here..."
    @State private var includeLogs = false
    @State private var subject = "Help"
    
    @State private var prefferedContactMethod = ContactMethod.email
    
    enum ContactMethod {
        case email, phone
    }
 
  var body: some View {
    NavigationView{
        
        Form {
        
        Section(header: Text("How can we reach you?")){
            Picker("Contact Method", selection: $prefferedContactMethod) {
                Text("Email").tag(ContactMethod.email)
                Text("Phone").tag(ContactMethod.phone)
            }
            .pickerStyle(SegmentedPickerStyle())
            switch prefferedContactMethod {
            case .email:
                TextField("Email Address", text: $emailAddress)
            case .phone:
                TextField("Phone Number", text: $phoneNumber)
            }
        }
        
        Section(header: Text("What can we help you with?")) {
            Picker("Subject", selection: $subject) {
                ForEach(["Help", "Suggestion", "Bug Report"], id: \.self) { subject in
                        Text(subject)
                    
                }
            }
        }
        
        Section(header: Text("Briefly explain what`s going on.")){
            TextEditor(text: $message)
        }
        
        Section(footer: Text("This information will be sent anonymously.")){
            Toggle("Include Logs", isOn: $includeLogs)
        }
        
        Button("Submit", action: {
            print("Submit button tapped")
        }
        )
        }
        .navigationTitle("Contact Us")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
