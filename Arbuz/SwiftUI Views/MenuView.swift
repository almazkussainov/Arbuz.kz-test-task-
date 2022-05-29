//
//  MainView.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 28.05.2022.
//

import SwiftUI

struct MenuView: View {
    //MARK: - PROPERTIES
    var farms: [Farm] = farmsData
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Арбузные фермы")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .serif))
                    .foregroundColor(.black)
                    .padding(8)
                
                VStack(alignment: .center, spacing: 20) {
                    ForEach(farms) { item in
                        NavigationLink {
                                FarmDetailView(farm: item)
                        } label: {
                            FarmCardView(farm: item)
                        }
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
            }
            .navigationBarItems(
                leading: Image("arbuzlogo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100)
                    )
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

//MARK: - PREVIEW

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}




