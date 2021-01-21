//
//  AddView.swift
//  SwiftUI_ToDoSaveLocal_doz_12
//
//  Created by Alexander Hoch on 21.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//
import SwiftUI

struct AddView: View {
   @State var username: String = ""
      @State var isPrivate: Bool = true
      @State var notificationsEnabled: Bool = false
      @State private var previewIndex = 0
      var previewOptions = ["Always", "When Unlocked", "Never"]
  var body: some View {
    NavigationView {
        Form {
            Section(header: Text("PROFILE")) {
                TextField("Username", text: $username)
                Toggle(isOn: $isPrivate) {
                    Text("Private Account")
                }
            }
            
            Section(header: Text("NOTIFICATIONS")) {
                Toggle(isOn: $notificationsEnabled) {
                    Text("Enabled")
                }
               
            }
            
            Section(header: Text("ABOUT")) {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("2.2.1")
                }
            }
            
            Section {
                Button(action: {
                    print("Perform an action here...")
                }) {
                    Text("Reset All Settings")
                }
            }
        }
    }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
