//
//  PlaceView.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 29.05.2022.
//

import SwiftUI

struct PlaceView: View {
    var availability: Color
    var watermelon: Watermelon
    @State private var isSelected = false
    
    @ObservedObject var viewModel: TestViewModel
    
    var body: some View {
        Rectangle()
            .fill(availability)
            .frame(width: UIScreen.main.bounds.width/7 - 20, height: UIScreen.main.bounds.width/7 - 20, alignment: .center)
            .border(isSelected ? .blue : .white, width: 2)
            .onTapGesture {
                if availability == .green && selectedWatermelonsCount < 1 {
                    if isSelected == false {
                        isSelected = true
                        selectedWatermelonsCount += 1
                        viewModel.selectedWatermelon = watermelon
                    } else {
                        isSelected = false
                        selectedWatermelonsCount -= 1
                        viewModel.selectedWatermelon = nil
                    }
                } else if availability == .green && selectedWatermelonsCount == 1 {
                    if isSelected {
                        isSelected = false
                        selectedWatermelonsCount -= 1
                        viewModel.selectedWatermelon = nil
                    }
                }
            }
    }
}

struct PlaceView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceView(availability: .green, watermelon: watermelons1[0], viewModel: TestViewModel())
    }
}
