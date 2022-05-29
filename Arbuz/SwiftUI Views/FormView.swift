//
//  FromView.swift
//  Arbuz
//
//  Created by Алмаз Кусаинов on 28.05.2022.
//

import SwiftUI
import iPhoneNumberField

struct FormView: View {
    //MARK: - PROPERTIES
    let farm: Farm
    
    @State var numberOfWatermelons = 1
    @State var name: String = ""
    @State var adress: String = ""
    @State var flatNumber: String = ""
    @State var floor: String = ""
    @State var deliveryDate = Date()
    @State var cutIntoSlices = false
    @State var phoneNumber = ""
    @State var isShowingConfirmation = false
    
    let cutIntoSlicesPrice = 700
    
    @ObservedObject var selectedWatermelon: TestViewModel
    
    var keyboardHide : some View {
        Button(action: {
        hideKeyboard()
        }) {
            Image(systemName: "keyboard.chevron.compact.down")
                .foregroundColor(.green)
        }
    }
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Stepper("Количество: \(numberOfWatermelons)", value: $numberOfWatermelons, in: 1...3)
                    }
                    
                    Section {
                        iPhoneNumberField("(777)777-77-77", text: $phoneNumber)
                            .flagHidden(false)
                            .flagSelectable(true)
                        
                        TextField("Улица и номер дома", text: $adress)

                        HStack {
                            TextField("Квартира", text: $flatNumber)
                            Divider()
                            TextField("Этаж", text: $floor)
                        }
                    }
                    
                    Section() {
                        DatePicker("Дата доставки", selection: $deliveryDate, in: Date()...Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * 8)))
                            .font(Font.callout)
                    }
                    
                    Section {
                        Toggle("Порезать дольками (\(cutIntoSlicesPrice) тг)", isOn: $cutIntoSlices)
                    }
                }
                
                Button {
                    //ACTION
                    saveUser()
                } label: {
                    Spacer()
                    
                    VStack {
                        Text("Заказать")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text(String((selectedWatermelon.selectedWatermelon?.mass ?? 0) * numberOfWatermelons) + " кг" + " = \((selectedWatermelon.selectedWatermelon?.mass ?? 0) * numberOfWatermelons*(farm.price) + (cutIntoSlices ? cutIntoSlicesPrice : 0)) тг")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.green)
                )
            }
            .navigationBarTitle("Заказать")
            .ignoresSafeArea()
            .navigationBarItems(trailing: keyboardHide)
            .alert(isPresented: $isShowingConfirmation) {
                Alert(title: Text("Спасибо за покупку"), message: Text("С Вами в ближайшее время свяжутся"), dismissButton: .default(Text("Ok")))
            }
            
        }
    }
    
    func saveUser() {
        print("User saved")
        isShowingConfirmation = true
    }
}

//MARK: - PREVIEW
struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(farm: farmsData[0], selectedWatermelon: TestViewModel())
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

