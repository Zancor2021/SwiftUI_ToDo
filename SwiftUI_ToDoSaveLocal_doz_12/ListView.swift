//
//  ListView.swift
//  SwiftUI_ToDoSaveLocal_doz_12
//
//  Created by Alexander Hoch on 21.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//

import SwiftUI

struct ListView: View {
   
        @ObservedObject var dm:DataController = DataController()
           
           var body: some View {
            NavigationView{
               List(dm.todoData) { item in
                  // NavigationLink(destination:DetailView(imgPath: item.imgpath, txt: item.title)){
                ListRowView(description: item.description, category: self.dm.categories[item.category], date: item.date)
                 //  }
                   
               }.onAppear(){
                self.dm.loadToDoToFromFile()
               }.navigationBarTitle("TODO'S",displayMode: .inline).navigationBarItems(trailing:
                NavigationLink(destination: AddView()){
                 Image(systemName: "heart")
                }
                )
                
            }
       }
    
}

struct ListRowView:View{
    
    var description:String = "default"
    var category:String = "default"
    var date:String = "default"
    
    @State private var animationAmount: CGFloat = 0

    var body: some View {
        HStack {
            
            VStack{
                Text(description)
                    .font(.body)
                    .frame(width: 230, height: 30, alignment: .leading)
                
                Text(date)
                    .font(.footnote)
                    .frame(width: 230, height: 16, alignment: .leading)
                Text(category)
                .font(.footnote)
                .frame(width: 230, height: 18, alignment: .leading)
            }
           
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
