//
//  EditDashboard.swift
//  app998
//
//  Created by Dias Atudinov on 15.10.2024.
//

import SwiftUI

struct EditDashboard: View {
    
    @ObservedObject var viewModel: DashboardViewModel
    
    @State var saved = ""
    @State var market = ""
    @State var categoryOne = ""
    @State var valueOne = ""
    @State var categoryTwo = ""
    @State var valueTwo = ""
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.secondBG.ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                
                ZStack {
                    Color.mainBG
                    HStack {
                        Text("Edit dashboard")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                                .foregroundColor(.secondaryBlue)
                        }
                        Spacer()
                    }.padding(.horizontal)
                }.frame(height: 48)
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        VStack(alignment: .leading) {
                            Text("How much is saved with coupons")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            TextField("", text: $saved)
                                .keyboardType(.decimalPad)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.white.opacity(0.08))
                                .cornerRadius(12)
                                .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1).foregroundColor(.white.opacity(0.08))
                                )
                        }
                        
                        VStack(alignment: .leading) {
                            Text("The market with the most discounts")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            TextField("", text: $market)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.white.opacity(0.08))
                                .cornerRadius(12)
                                .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1).foregroundColor(.white.opacity(0.08))
                                )
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Popular category #1")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            TextField("", text: $categoryOne)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.white.opacity(0.08))
                                .cornerRadius(12)
                                .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1).foregroundColor(.white.opacity(0.08))
                                )
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Value in per cent ")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            TextField("", text: $valueOne)
                                .keyboardType(.decimalPad)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.white.opacity(0.08))
                                .cornerRadius(12)
                                .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1).foregroundColor(.white.opacity(0.08))
                                )
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Popular category #2")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            TextField("", text: $categoryTwo)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.white.opacity(0.08))
                                .cornerRadius(12)
                                .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1).foregroundColor(.white.opacity(0.08))
                                )
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Value in per cent ")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            TextField("", text: $valueTwo)
                                .keyboardType(.decimalPad)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.white.opacity(0.08))
                                .cornerRadius(12)
                                .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1).foregroundColor(.white.opacity(0.08))
                                )
                        }
                        
                        
                    }.padding(.horizontal).padding(.top, 24)
                    
                    
                }
                Button {
                    if let saved = Double(saved), !market.isEmpty, !categoryOne.isEmpty, let valueOne = Double(valueOne), !categoryTwo.isEmpty, let valueTwo = Double(valueTwo) {
                        
                        viewModel.editData(saved, market: market, categoryOne: categoryOne, valueOne: valueOne, categoryTwo: categoryTwo, valueTwo: valueTwo)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 90)
                            .cornerRadius(20)
                            .foregroundColor(.primaryBlue)
                        
                        HStack(spacing: 12) {
                            Text("Edit")
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(.white)
                            ZStack {
                                Circle()
                                    .frame(height: 38)
                                    .foregroundColor(.white.opacity(0.3))
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 15)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .onAppear {
                    saved = "\(viewModel.data.saved)"
                    market = viewModel.data.market
                    categoryOne = viewModel.data.categoryOne
                    valueOne = "\(viewModel.data.valueOne)"
                    categoryTwo = viewModel.data.categoryTwo
                    valueTwo = "\(viewModel.data.valueTwo)"
                    
                }
            }.ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    EditDashboard(viewModel: DashboardViewModel())
}
