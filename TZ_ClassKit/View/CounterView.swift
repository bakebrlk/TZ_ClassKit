//
//  CounterView.swift
//  TZ_ClassKit
//
//  Created by bakebrlk on 08.10.2024.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject private var vm: CounterVM = CounterVM.shared
    
    var body: some View {
        VStackLayout{
            Spacer()
            
            count
            
            btnsStructure
            
            Spacer()
            
            screenTheme
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(vm.themeStatus == .dark ? Color.primary : Color.cyan)
    }
    
    private var count: some View {
        Text("\(Int(vm.count))")
            .frame(maxWidth: .infinity)
            .foregroundColor(vm.themeStatus == .dark ? .purple : .white)
            .font(.system(size: 150, weight: .black))
            .lineLimit(1)
    }
    
    private var btnsStructure: some View {
        HStackLayout {
            
            btnConstruct(imageName: "arrow.circlepath", activate: .constant(true), direction: .right)
                
            
            Spacer()
            
            btnConstruct(imageName: "plus", activate: .constant(true), direction: .left)
                
        }
    }
    
    private var screenTheme: some View {
        Button(action: {
            vm.changeThemeStatus()
        }, label: {
            Image(systemName: vm.themeStatus == .light ? "sun.max" : "sun.max.fill")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(maxWidth: UIScreen.main.bounds.width/6)
                .foregroundColor(vm.themeStatus == .dark ? .mint : .white)
                .background(vm.themeStatus == .light ? vm.lightColors : vm.darkColors)
                .cornerRadius(UIScreen.main.bounds.width/3)

        })
    }
    
    private func btnConstruct(imageName: String, activate: Binding<Bool>, direction: ButtonsDirection) -> some View {
        Button(action: {
            if direction == .left {
                vm.countPlus()
            }else {
                vm.revalue()
            }
        }, label: {
            ZStack(alignment: direction == .right ? .leading : .trailing){
                
                Group{
                    if direction == .right{
                        RightTriangle()
                            
                    } else {
                        LeftTriangle()
                    }
                }
                .frame(maxWidth: UIScreen.main.bounds.width/2.5, maxHeight: UIScreen.main.bounds.width/2.5)
                .foregroundStyle(vm.themeStatus == .light ? vm.lightColors : vm.darkColors)
                .cornerRadius(20)
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width/7)
                    .foregroundColor(vm.themeStatus == .dark ? .mint : .white)
                    .padding( direction == .right ? .leading : .trailing)
                    
            }
        })
    }
}

#Preview {
    CounterView()
}
