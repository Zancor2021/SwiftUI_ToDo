//
//  ContentView.swift
//  SwiftUI_ToDoSaveLocal_doz_12
//
//  Created by Alexander Hoch on 21.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//

import SwiftUI

struct StartView: View {
    @State var isStart = false
    var body: some View {
        
        VStack{
            if(isStart){
                OptionView()
            }else{
                Text("The New Beginning").onTapGesture {
                    self.isStart = true
                }
            }
        }
        
        
        
       
            
        }
    }


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
