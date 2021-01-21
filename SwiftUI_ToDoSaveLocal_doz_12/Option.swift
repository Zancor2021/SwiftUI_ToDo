//
//  Option.swift
//  SwiftUI_ToDoSaveLocal_doz_12
//
//  Created by Alexander Hoch on 21.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//

import SwiftUI

struct OptionView: View {
   var categories = ["private", "office", "party"]
      @State private var selectedCat = 1

      var body: some View {
      NavigationView {
        Form {
          Section(header: Text("Choose Category")) {
            Picker(selection: $selectedCat, label: Text("Categorie")) {
               ForEach(0 ..< categories.count) {
                  Text(self.categories[$0])
               }
            }
            Text("You selected: \(categories[selectedCat])")
         }
        }
        }
}
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView()
    }
}
