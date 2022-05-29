//
//  InfoPanelView.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 28.05.2022.
//

import SwiftUI

struct InfoPanelView: View {
    var body: some View {
        HStack {
            Rectangle()
                .fill(.green)
                .frame(maxWidth: 20, maxHeight: 20)
            
            Text("Спелый")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Rectangle()
                .fill(.red)
                .frame(maxWidth: 20, maxHeight: 20)
            
            Text("Уже сорван")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Rectangle()
                .fill(.gray)
                .frame(maxWidth: 20, maxHeight: 20)
            
            Text("Неспелый")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.gray)
                .opacity(0.6)
        )
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView()
    }
}

