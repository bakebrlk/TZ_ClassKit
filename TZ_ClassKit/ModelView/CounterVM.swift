//
//  CounterVM.swift
//  TZ_ClassKit
//
//  Created by bakebrlk on 08.10.2024.
//

import SwiftUI

final class CounterVM: ObservableObject {
    @StateObject public static var shared: CounterVM = CounterVM()
    
    @Published public var count: CGFloat = 0
    
    public func countPlus() {
        withAnimation{
            count += 1
        }
    }
    
    public func revalue() {
        withAnimation {
            count = 0
        }
    }
}
