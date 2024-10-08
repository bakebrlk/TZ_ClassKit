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
    @Published public var themeStatus: ScreenThemeStatus = .dark
    
    public var lightColors: Gradient = Gradient(colors: [.yellow, .orange])
    public var darkColors: Gradient = Gradient(colors: [.blue, .purple])
    
    public func changeThemeStatus() {
        withAnimation {
            if themeStatus == .dark {
                themeStatus = .light
            }else{
                themeStatus = .dark
            }
        }
    }
    
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
