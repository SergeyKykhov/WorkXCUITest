//
//  TableViewCows.swift
//  Cows
//
//  Created by Sergey Kykhov on 03.11.2023.
//

import SwiftUI

struct TableViewCows: View {

    var array = Array(1...22)
    @State private var showAlert = false

    var body: some View {
        List {
            ForEach(array, id:\.self) { item in
                HStack{
                    Text(String(item))
                    Spacer()
                    Image(systemName: "arrow.up")
                        .padding(10)
                        .background(.gray.opacity(0.3))
                        .onTapGesture {
                            print("нажата кнопка \(item)")
                            showAlert = true
                        }
                        .accessibilityIdentifier("id: Image")
                }
            }
        }
        .accessibilityIdentifier("id: List")
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Нажал кнопку"),
                message: Text("Молодец!"),
                dismissButton: .default(Text("Согласен"))
            )
        }
    }
}

//#Preview {
//    TableViewCows()
//}
