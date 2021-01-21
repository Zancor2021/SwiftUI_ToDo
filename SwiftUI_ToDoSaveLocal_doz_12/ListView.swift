//
//  ListView.swift
//  SwiftUI_ToDoSaveLocal_doz_12
//
//  Created by Alexander Hoch on 21.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List{
            Text("1")
            Text("2")
            Text("3")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
