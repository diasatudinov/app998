//
//  CreateDiscountUIView.swift
//  app998
//
//  Created by Dias Atudinov on 16.10.2024.
//

import SwiftUI

struct CreateDiscountUIView: View {
    
    @ObservedObject var viewModel: DiscountsViewModel
    
    @State var name = ""
    @State var market = ""
    @State var category = ""
    @State var startDate = Date()
    @State var endDate = Date()
    @State var note = ""
    
    @State var startDatePickerShow = false
    @State var endDatePickerShow = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.secondBG.ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            VStack(alignment: .leading) {
                
                ZStack {
                    Color.mainBG
                    HStack {
                        Text("Add discount")
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
                            Text("Name")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            TextField("Discount 2 for the price of 1", text: $name)
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
                            Text("Market")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            TextField("Domino's Pizza", text: $market)
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
                            Text("Category")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            TextField("Food", text: $category)
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
                            Text("Start date")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            VStack {
                                HStack {
                                    Text("\(formattedDate(date: startDate))")
                                        .foregroundColor(.white)
                                        .padding()
                                        .onTapGesture {
                                            startDatePickerShow.toggle()
                                        }
                                    //.frame(maxWidth: .infinity)
                                    
                                    Spacer()
                                    
                                }.background(Color.white.opacity(0.08))
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 1).foregroundColor(.white.opacity(0.08))
                                    )
                                if startDatePickerShow {
                                    
                                    DatePicker(
                                        "Choose your date",
                                        selection: $startDate,
                                        displayedComponents: [.date]
                                    )
                                    .datePickerStyle(.wheel)
                                    .labelsHidden()
                                    .background(Color.clear)
                                    
                                }
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Finish date")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            VStack {
                                HStack {
                                    Text("\(formattedDate(date: endDate))")
                                        .foregroundColor(.white)
                                        .padding()
                                        .onTapGesture {
                                            endDatePickerShow.toggle()
                                        }
                                    //.frame(maxWidth: .infinity)
                                    
                                    Spacer()
                                    
                                }.background(Color.white.opacity(0.08))
                                    .cornerRadius(12)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 1).foregroundColor(.white.opacity(0.08))
                                    )
                                if endDatePickerShow {
                                    
                                    DatePicker(
                                        "Choose your date",
                                        selection: $endDate,
                                        displayedComponents: [.date]
                                    )
                                    .datePickerStyle(.wheel)
                                    .labelsHidden()
                                    .background(Color.clear)
                                    
                                }
                            }
                        }
                        
                
                        
                        VStack(alignment: .leading) {
                            Text("Note")
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                            
                            
                            TextEditor(text: $note)
                                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
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
                    if !name.isEmpty, !market.isEmpty, !category.isEmpty, !note.isEmpty {
                        let discount = Discount(name: name, market: market, category: category, startDate: startDate, endDate: endDate, note: note)
                        viewModel.addDiscount(discount)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 90)
                            .cornerRadius(20)
                            .foregroundColor(.primaryBlue)
                        
                        HStack(spacing: 12) {
                            Text("Create")
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
                
            }.ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        }
    }
    
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        return formatter.string(from: date)
    }
}


#Preview {
    CreateDiscountUIView(viewModel: DiscountsViewModel())
}


