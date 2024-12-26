//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Willy Hsu on 2024/12/20.
//

import SwiftUI

struct ContentView: View {
    @State private var selectionId = 0

    var body: some View {
        TabView(selection: $selectionId) {
            CalculatorView()
                .tabItem {
                    Image(systemName: "arrowshape.left.circle.fill")
                    Text("計算機")
                }
                .tag(0)
            MyResumeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("首頁")
                }
                .tag(1)
            FunctionPage()
                .tabItem {
                    Image(systemName: "arrowshape.right.circle.fill")
                    Text("功能")
                }
                .tag(2)
        }
    }
}




#Preview {
    ContentView()
}
