//
//  Option.swift
//  SwiftUI_ToDoSaveLocal_doz_12
//
//  Created by Alexander Hoch on 21.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//

import SwiftUI

extension Binding {
    func didSet(execute: @escaping (Value) -> Void) -> Binding {
        return Binding(
            get: {
                return self.wrappedValue
            },
            set: {
                self.wrappedValue = $0
                execute($0)
            }
        )
    }
}

struct OptionView: View {
    @ObservedObject var dm:DataController = DataController()
    
     var body: some View {
      NavigationView {
        Form {
          Section(header: Text("Choose Category")) {
            Picker(selection: $dm.optionData.category.didSet(execute: { (state) in
                self.dm.optionData.category = state
                self.dm.saveOption()
            }), label: Text("Categorie")) {
                ForEach(0 ..< dm.categories.count) {
                    Text(self.dm.categories[$0])
               }
            }.disabled(self.dm.optionData.isOn)
            Toggle("show all categories",isOn: $dm.optionData.isOn.didSet(execute: { (state) in
               self.dm.optionData.isOn = state
               self.dm.saveOption()
            }))
            
            
            }
            
        
            
            
            
        }.onAppear(){
            self.dm.loadOption()
        }
        }
}
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView()
    }
}
