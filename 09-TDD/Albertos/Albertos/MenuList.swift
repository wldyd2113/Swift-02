//
//  ContentView.swift
//  Albertos
//
//  Created by 차지용 on 7/10/24.
//

import SwiftUI

struct MenuList: View {
    let viewModel: ViewModel
    
    var body: some View {
        MenuRow(viewModel: .init(item: item))
        switch viewModel.sections {
        case .success(let sections):
            List {
                ForEach(sections) { section in
                    Section(header: Text(section.category)) {
                        ForEach(section.items) { item in
                            MenuRow(viewModel: .init(item: item))
                        }
                    }
                }
            }
            .navigationTitle("Alberto's 🇮🇹")
        case .failure(let error):
            Text("An error occurred:")
            Text(error.localizedDescription).italic()
        }
    }
}

#Preview {
    MenuList(viewModel: .init())
}

