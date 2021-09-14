//
//  PasswordSetupView.swift
//  PasswordSetup
//
//  Created by Ryan Zi on 9/13/21.
//

import SwiftUI

struct PasswordSetupView: View {
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    func savePassword() -> Void {
        print("Saved password: \(password)")
        UserDefaults.standard.set(password, forKey: "KMASTER_PASSWORD")
    }
    
    var body: some View {
        VStack(){
            TextField("Enter Password", text: $password)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(5)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            TextField("Re-enter Password", text: $confirmPassword)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(5)
                .disableAutocorrection(true)
                .autocapitalization(.none)
            Button(action:{
                if password.count>0 && password == confirmPassword {
                    savePassword()
                }
            }) {
                HStack(){
                    Text("Submit")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.blue)
                }
                .padding(10)
                .background(
                    Capsule().strokeBorder(Color.blue, lineWidth: 2.0)
                )
                .accentColor(Color.white)
            }
        }
    }
}

struct PasswordSetupView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordSetupView()
    }
}
