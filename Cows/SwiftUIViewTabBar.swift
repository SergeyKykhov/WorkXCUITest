//
//  SwiftUIViewTabBar.swift
//  Cows
//
//  Created by Sergey Kykhov on 03.11.2023.
//

import SwiftUI

struct SwiftUIViewTabBar: View {
    var body: some View {
        TabView {
            ContentView()
                .badge(2)
                .tabItem {
                    Label("Информауия о корове", systemImage: "plus")
                }
            TableViewCows()
                .tabItem {
                    Label("Таблица с коровми", systemImage: "minus")
                }
        }
    }
}

//#Preview {
//    SwiftUIViewTabBar()
//}
