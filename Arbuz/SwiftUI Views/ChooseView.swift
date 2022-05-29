//
//  ChooseView.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 29.05.2022.
//

import SwiftUI

struct ChooseView: View {
    //MARK: - PROPERTIES
    let watermelons: [Watermelon]
    let farm: Farm

    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn = 7.0
    @State private var gridOffset: CGSize = .zero
    @State private var gridScale: CGFloat = 1
    @State private var isShowingForm = false
    @State private var isNavigationBarHidden: Bool = false
    
    @ObservedObject var selectedWatermelon = TestViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
            VStack {
                InfoPanelView()
                    .offset(x: 20)
                    .layoutPriority(1)
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: Int(gridColumn)), alignment: .center, spacing: 10) {
                        ForEach(watermelons) { item in
                            PlaceView(availability: item.availability, watermelon: item, viewModel: selectedWatermelon)
                        }
                    }
                    .padding()
                    .offset(x: gridOffset.width, y: gridOffset.height)
                    .scaleEffect(gridScale)
                    .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                withAnimation(.linear(duration: 1)) {
                                    gridOffset = gesture.translation
                                }
                            })
                    )
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ gesture in
                                withAnimation(.linear(duration: 1)) {
                                    gridScale = gesture
                                }
                            })
                    )
                }
                .overlay(
                    VStack(alignment: .leading, spacing: 12) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(selectedWatermelon.selectedWatermelon?.mass ?? 0) кг")
                                    .font(.body)
                                    .fontWeight(.medium)
                                    .foregroundColor(.black)
                        }
                        .padding()
                        
                        Button {
                            //ACTION
                            isShowingForm.toggle()
                        } label: {
                            HStack {
                                Spacer()
                                
                                VStack {
                                    Text("Перейти к заказу")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        
                                    HStack {
                                        Text(String(farm.price) + " ₸/кг")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                        
                                        if let watermelonMass = selectedWatermelon.selectedWatermelon?.mass {
                                            Text(" x "+String(watermelonMass) + "кг")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                        }
                                    }
                                }
                                .foregroundColor(.white)
                                .padding()
                                
                                Spacer()
                            }
                            .background(
                                Rectangle().fill(.green)
                            )
                            .sheet(isPresented: $isShowingForm) {
                                FormView(farm: farm, selectedWatermelon: selectedWatermelon)
                            }
                        }
                        
                    }
                        .background(
                            Rectangle().fill(.white)
                        )
                    ,alignment: .bottom
                )
                .ignoresSafeArea()
            }
            .navigationBarTitle("Выбрать арбуз")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .onAppear {
                self.isNavigationBarHidden = true
            }
    }
}

//MARK: - PREVIEW
struct ChooseView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseView(watermelons: farmsData[0].watermelons, farm: farmsData[0])
    }
}


class TestViewModel: ObservableObject {
    @Published var selectedWatermelon: Watermelon? = nil
}
