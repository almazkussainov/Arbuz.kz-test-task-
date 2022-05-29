//
//  GridView.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 29.05.2022.
//

import SwiftUI

var selectedWatermelonsCount: Int = 0

struct GridView: View {
    //MARK: - PROPERTIES
    var watermelons: [Watermelon]
    var gridColumn: Double
    @State private var isSelected = false
    var selectedWatermelon = TestViewModel()
    
    //MARK: - BODY
    var body: some View {
        
        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: Int(gridColumn)), alignment: .center, spacing: 10) {
            ForEach(watermelons) { item in
                PlaceView(availability: item.availability, watermelon: item, viewModel: selectedWatermelon)
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(watermelons: watermelons1, gridColumn: 7.0)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
