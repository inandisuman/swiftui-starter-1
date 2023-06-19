//
//  CheckoutView.swift
//  swiftui-starter-project
//
//  Created by Suman Nandi on 18/06/23.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    @State private var paymentMode = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 10
    @State private var showingPaymentAlert = false
    
    
    let paymentTypes = ["Cash", "Credit Card", "Points"]
    let tipAmounts = [0, 10, 15, 20, 25]
    
    var totalPrice: String {
        let total = order.items.reduce(0) { $0 + $1.price }
        let tipValue = Double(total) / 100 * Double(tipAmount)
        return (Double(total) + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Select Payment mode", selection: $paymentMode) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Pay using points?", isOn: $addLoyaltyDetails)
                
                if addLoyaltyDetails {
                    TextField("Enter your Loyalty ID", text: $loyaltyNumber)
                }
                
            }
            
            Section("Add a tip?") {
                Picker("Select tip", selection: $tipAmount) {
                    ForEach(tipAmounts, id:\.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section("Total Price : \(totalPrice)") {
                Button("Confirm order") {
                    showingPaymentAlert.toggle()
                    order.items.removeAll()
                }
                .disabled(order.items.isEmpty)
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showingPaymentAlert) {
            //No buttons
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
