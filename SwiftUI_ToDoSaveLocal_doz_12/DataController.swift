//
//  DataController.swift
//  SwiftUI_MiniEditorSaveToFile_doz_11
//
//  Created by Alexander Hoch on 19.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//

import Foundation
import SwiftUI


struct Option:Codable {
  
    var category:Int         =  1
    var isOn:Bool            = false
}

struct ToDo:Identifiable,Codable {
    let id = UUID()
    var description:String      =  "Treffen mit Sonne"
    var category:Int            =  1
    var lat:String              =  "53.12345"
    var lon:String              =  "13.5678"
    var date:String             =  "20.01.2021 13:45:13"
}

class DataController:ObservableObject{
        
    @Published var categories = ["private", "office", "party"]
    @Published var todoData: [ToDo] = []
    @Published var optionData: Option = Option()
    
    init() {
        // let defaults = UserDefaults.standard
        //defaults.removeObject(forKey: "SavedOptions")
        loadOption()
       /*setTestToDoData()*/
    }
    
    
    func setTestToDoData(){
      /*todoData.append(ToDo(description: "Treffe Marie", category: 0, lat: "53.123455", lon: "13.212", date: "24.01.2021 22:45:00"))
        todoData.append(ToDo(description: "Meeting Welt Marketing", category: 1, lat: "53.123455", lon: "13.212", date: "30.01.2021 10:30:00"))
        todoData.append(ToDo(description: "Einkaufen mit Sonne", category: 1, lat: "53.123455", lon: "13.212", date: "23.01.2021 12:00:00"))*/
    }
    
    
    func addTodo(todo:ToDo){
     
        loadToDoToFromFile()
        todoData.append(todo)
        saveToDoToFile()
    }
    
    func getPath()->String{
           // 1
           let rootPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, .userDomainMask, true)[0]
           print(rootPath)
           return rootPath.appendingFormat("/todos1.plist")
       }
    
    func saveToDoToFile(){
      let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("todos1.plist")
        print(path)
        let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
        do{
            let data = try encoder.encode(todoData)
            try data.write(to: path)
        }catch {
             print(error)
        }
    }
    
    func loadToDoToFromFile(){
          let path = getPath()
        
        if  let xml         = FileManager.default.contents(atPath: path),
            let todos = try? PropertyListDecoder().decode([ToDo].self, from: xml)
        {
            print(todos[0].description)
            todoData = todos
        }
        
    }
    
    func saveOption(){
      let encoder = JSONEncoder()
      if let encoded = try? encoder.encode(optionData) {
          let defaults = UserDefaults.standard
          defaults.set(encoded, forKey: "SavedOptions")
      }    }
    
    func loadOption(){
        let defaults = UserDefaults.standard
        if let savedOptions = defaults.object(forKey: "SavedOptions") as? Data {
            let decoder = JSONDecoder()
            if let loadedOption = try? decoder.decode(Option.self, from: savedOptions) {
                optionData = loadedOption
            }
        }else{
            
            optionData.category = 0
            optionData.isOn = false
            saveOption()
        }
    }

    
    
    
  
    
   
}
