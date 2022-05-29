//
//  FarmDetailView.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 29.05.2022.
//

import SwiftUI

struct FarmDetailView: View {
    //MARK: - PROPERTIES
    var farm: Farm
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isNaigationBarHidden: Bool = false
    
    var btnBack : some View {
        Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left") // set image here
                .aspectRatio(contentMode: .fit)
                
                Text("Back")
                    .font(.body)
            }
            .foregroundColor(.green)
        }
    }
    
    //MARK: - BODY
    var body: some View {
                ScrollView(.vertical, showsIndicators: false) {
                    Group {
                        // IMAGE
                        Image(farm.fruitImage)
                            .resizable()
                            .scaledToFit()
                        //RATING
                        HStack(alignment: .center, spacing: 5) {
                            ForEach(1...farm.rating, id: \.self) { item in
                                Image(systemName: "star.fill")
                                    .font(.body)
                                    .foregroundColor(.yellow)
                            }
                        }
                        .padding(.top, 12)
                        
                        Text(String(farm.price) + " ₸ / кг")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding()
                        
                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Text(farm.sort)
                                    .font(.body)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                
                                Spacer()
                            }
                            
                            Text("Описание")
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                            
                            Text(farm.description)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                            
                            Text("Преимущества сортов")
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                            
                            Text(farm.advantages)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        }
                    }
                }//: SCROLL
            .overlay(
                NavigationLink {
                    //ACTION
                    ChooseView(watermelons: farm.watermelons, farm: farm)
                } label: {
                    Spacer()
                    Text("Оформить заказ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(20)
                    Spacer()
                }
                    .background(
                        Rectangle()
                            .fill(.green)
                    )
                , alignment: .bottom
            )
            .ignoresSafeArea()
            .navigationTitle(farm.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
    }
}

//MARK: - PREVIEW
struct FarmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FarmDetailView(farm: farmsData[0])
    }
}
