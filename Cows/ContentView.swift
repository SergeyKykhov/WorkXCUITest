//
//  ContentView.swift
//  Cows
//
//  Created by Sergey Kykhov on 03.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    @Environment(\.dismiss) var dismiss
    @State private var nameCow = ""

    var body: some View {
        ScrollView {
            VStack {
                Image("Cow")
                    .resizable()
                    .scaledToFit()
                    .accessibilityIdentifier("id: изображение корова")

                Text("Корова")
                    .font(.largeTitle)
                    .bold()
                    .accessibilityIdentifier("id: заголовок корова")

                Text("""
    Корова — отелившаяся самка крупного рогатого скота, то есть домашнего быка. Прежде чем стать коровой, самка быка является тёлкой (до первого оплодотворения), после оплодотворения до первых родов она называется нетелью.
    Коровы используются для получения потомства, а также молочной и мясной продукции.
    Коровами называются также самки некоторых других парнокопытных, к примеру, зубров.
    Масса новорождённых тёлок зависит от породы и составляет 18-45 кг, реже до 60 кг. В отличие от быков, которые обычно весят 300—900 кг, масса взрослых коров всего 200—600 кг, реже до 1000 кг.
""")
                .font(.system(size: 17))
                .accessibilityIdentifier("id: описание коровы")

                TextField("Имя коровы", text: $nameCow)
                                    .textFieldStyle(.roundedBorder)
                                    .accessibilityIdentifier("id:bTextField Имя коровы")

                Button("Узнать больше") {
                    showAlert.toggle()
                }
                .buttonStyle(.borderedProminent)
                .accessibilityIdentifier("id: кнопка узнать больше")
            }
            .padding(10)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Интересно?"),
                message: Text("Если хочешь знать больше, учись гуглить все самостоятельно!"),
                dismissButton: .default(Text("Ок"))
            )
        }
        .accessibilityIdentifier("id:  Alert Интересно?")
    }
}

//#Preview {
//    ContentView()
//}
