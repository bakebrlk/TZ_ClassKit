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
            count
            
            btnsStructure
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.primary)
    }
    
    private var count: some View {
        Text("\(Int(vm.count))")
            .frame(maxWidth: .infinity)
            .foregroundColor(.purple)
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
                .foregroundStyle(Gradient(colors: [.blue, .purple]))
                .cornerRadius(20)
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width/7)
                    .foregroundColor(.mint)
                    .padding( direction == .right ? .leading : .trailing)
                    
            }
        })
    }
}

#Preview {
    CounterView()
}
