//
//  MenuRow.ViewModel.swift
//  Albertos
//
//  Created by 차지용 on 7/11/24.
//

extension MenuRow {
    struct ViewModel {
        let text: String
        
        init(item: MenuItem) {
            text = item.name
        }
    }
}
