//
//  DiscountCell.swift
//  app998
//
//  Created by Dias Atudinov on 15.10.2024.
//

import SwiftUI

struct DiscountCell: View {
    @State var discount: Discount
    @ObservedObject var viewModel: DiscountsViewModel
    @State private var editDiscount = false
    var body: some View {
        ZStack {
            Color.mainBG
            ZStack {
                
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 6) {
                        HStack {
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 16)
                                .foregroundColor(.secondaryBlue)
                            
                            Text("\(formattedDate(date: discount.startDate)) —— \(formattedDate(date: discount.endDate))")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .regular))
                            
                        }.padding(8).padding(.horizontal, 4).background(Color.white.opacity(0.12)).cornerRadius(8)
                        
                        if discount.hasOneDayLeft {
                            HStack(spacing: 4) {
                                Text("🔥")
                                
                                Text("Soon to expire")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                            }.padding(8).padding(.horizontal, 4).background(Color.white.opacity(0.12)).cornerRadius(8)
                        }
                    }.padding(.bottom)
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text(discount.name)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold))
                        
                        Text(discount.note)
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 16, weight: .regular))
                    }.padding(.bottom, 12)
                        
                    HStack(spacing: 10) {
                        Image(systemName: "cart.fill")
                            .foregroundColor(.secondaryBlue)
                        
                        Text(discount.market)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                    }.padding(.bottom, 24)
                    
                    Button {
                        editDiscount = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 36)
                                .foregroundColor(.primaryBlue)
                                .cornerRadius(8)
                            Text("Edit")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .semibold))
                        }
                    }
                }.padding()
            }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).background(Color.white.opacity(0.12)).cornerRadius(16).opacity(discount.isArchive ? 0.6 : 1)
                .sheet(isPresented: $editDiscount) {
                    EditDiscountUIView(viewModel: viewModel, discount: discount)
                }
        }
    }
    
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}

#Preview {
    DiscountCell(discount: Discount(name: "Discount 2 for the price of 1", market: "Domino's Pizza", category: "Food", startDate: Date(), endDate: Calendar.current.date(byAdding: .hour, value: 0, to: Date()) ?? Date(), note: "Buy two pizzas and get the second one for free asdsadasd sadsad"), viewModel: DiscountsViewModel())
}
