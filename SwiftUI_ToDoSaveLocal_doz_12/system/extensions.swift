//
//  extensions.swift
//  SwiftUI_ToDoSaveLocal_doz_12
//
//  Created by Alexander Hoch on 22.01.21.
//  Copyright © 2021 zancor. All rights reserved.
//
import Foundation
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

