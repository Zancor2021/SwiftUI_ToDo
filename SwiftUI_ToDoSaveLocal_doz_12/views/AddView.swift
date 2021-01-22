//
//  AddView.swift
//  SwiftUI_ToDoSaveLocal_doz_12
//
//  Created by Alexander Hoch on 21.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//
import SwiftUI

struct AddView: View {
   
    @ObservedObject var dm:DataController = DataController()
    @State var todo:ToDo = ToDo()
    
  var body: some View {
    
        Form {
            Section(header: Text("Description")) {
                TextField("Username", text: $todo.description)
               
            }
            
            Section(header: Text("Date")) {
               TextField("Username", text: $todo.date)
            }
            
            Section(header: Text("Position")) {
               TextField("Latitude", text: $todo.lat)
                TextField("Longitude", text: $todo.lon)
            }
            
            Section(header: Text("Category")) {
              Picker(selection: $todo.category, label: Text("Categorie")) {
                               ForEach(0 ..< dm.categories.count) {
                                   Text(self.dm.categories[$0])
                              }
                           }
                
            }
            
            
            Section {
                Button(action: {
                    self.dm.addTodo(todo: self.todo)
                }) {
                    Text("add new Todo")
                      
                }.frame(width:350,height:50,alignment: .center)
            }
        }
    
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
