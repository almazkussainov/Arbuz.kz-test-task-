//
//  FarmCardView.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 29.05.2022.
//

import SwiftUI

struct FarmCardView: View {
    //MARK: - PROPERTIES
    var farm: Farm
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // CARD IMAGE
            Image(farm.image)
                .resizable()
                .scaledToFit()
                
            VStack(alignment: .leading, spacing: 12) {
                //TITLE
                Text(farm.title)
                    .font(.system(.title))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                HStack(alignment: .center, spacing: 5) {
                    ForEach(1...farm.rating, id: \.self) { item in
                        Image(systemName: "star.fill")
                            .font(.body)
                            .foregroundColor(.yellow)
                    }
                }
                
                HStack(alignment: .center, spacing: 12) {
                    HStack(alignment: .center, spacing: 2) {
                        Image(systemName: "mappin")
                        Text(farm.location)
                    }
                    HStack(alignment: .center, spacing: 2) {
                        Image(systemName: "tram.fill")
                        Text(farm.date)
                    }
                    HStack(alignment: .center, spacing: 2) {
                        Text(String(farm.price) + " ₸ / кг")
                    }
                }
                .font(.footnote)
                .foregroundColor(.gray)
            }//: VSTACK
            .padding()
            .padding(.bottom, 12)
        } //: VSTACK
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.gray, radius: 8, x: 0, y: 0)
    }
}

//MARK: - PREVIEW
struct FarmCardView_Previews: PreviewProvider {
    static var previews: some View {
        FarmCardView(farm: farmsData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
