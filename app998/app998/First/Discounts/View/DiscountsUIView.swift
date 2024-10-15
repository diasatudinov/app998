//
//  DiscountsUIView.swift
//  app998
//
//  Created by Dias Atudinov on 15.10.2024.
//

import SwiftUI


enum Tab {
    case active, history
}


struct DiscountsUIView: View {
    @ObservedObject var viewModel: DiscountsViewModel
    @State private var selectedTab: Tab = .active
    @State var category = ""
    
    @State private var showAddCategory = false
    var body: some View {
        ZStack {
            Color.mainBG.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    Text("Discounts")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                 Spacer()
                }.padding(.horizontal).padding(.bottom, 24)
                
                HStack {
                    Button {
                        withAnimation {
                            showAddCategory = true
                        }
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 15)
                            .foregroundColor(.secondaryBlue)
                            .padding(10)
                            .background(Color.white.opacity(0.12))
                            .cornerRadius(8)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.categories, id: \.self) { category in
                                Text(category)
                                    .foregroundColor(.white)
                                    .padding(8).padding(.horizontal, 8)
                                    .background(Color.white.opacity(0.12))
                                    .cornerRadius(8)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(lineWidth: viewModel.selectedCategory == category ? 1 : 0).foregroundColor(.secondaryBlue)
                                    ).padding(1)
                                    .onTapGesture {
                                        
                                        if viewModel.selectedCategory == category {
                                            viewModel.selectedCategory = nil
                                        } else {
                                            viewModel.selectedCategory = category
                                        }
                                    }
                            }
                        }
                    }
                }.padding(.horizontal).padding(.bottom, 24)
                
                Picker("Select a tab", selection: $selectedTab) {
                    Text("Active").tag(Tab.active)
                    Text("History").tag(Tab.history)
                }.frame(height: 28).pickerStyle(SegmentedPickerStyle()).padding(.horizontal).cornerRadius(7).padding(.bottom)
                    .onAppear {
                        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
                        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
                        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
                        UISegmentedControl.appearance().backgroundColor = UIColor(Color.white.opacity(0.06))
                        UISegmentedControl.appearance().selectedSegmentTintColor = .secondaryBlue
                    }
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        if viewModel.discounts.isEmpty {
                            VStack(spacing: 12) {
                                Text("You're not discounted")
                                    .font(.system(size: 22, weight: .bold))
                                Text("Add your discounts to the app to keep track of them and not lose them")
                                    .font(.system(size: 16, weight: .regular))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white.opacity(0.5))
                                    .padding(.bottom, 12)
                                Image("image-Empty")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 103)
                            }.foregroundColor(.white).padding(.horizontal, 35).padding(.top, 50)
                        } else {
                            if selectedTab == .active {
                                ForEach(viewModel.filteredDiscounts().filter({ $0.isArchive == false }), id: \.self) { discount in
                                    
                                    DiscountCell(discount: discount)
                                }
                            } else {
                                ForEach(viewModel.filteredDiscounts().filter({ $0.isArchive == true }), id: \.self) { discount in
                                    DiscountCell(discount: discount)
                                    
                                }
                            }
                        }
                    }.padding(.horizontal)
                }
                
                Button {
                   
                        
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 90)
                            .cornerRadius(20)
                            .foregroundColor(.primaryBlue)
                        
                        HStack(spacing: 12) {
                            Text("Create discount")
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(.white)
                            ZStack {
                                Circle()
                                    .frame(height: 38)
                                    .foregroundColor(.white.opacity(0.3))
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 15)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }.ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
            
            if showAddCategory {
                
                ZStack {
                    
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundColor(Color.black.opacity(0.5))
                        .onTapGesture {
                            showAddCategory = false
                        }
                    
                    VStack {
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.secondBG)
                                .cornerRadius(14)
                                
                            
                            VStack(spacing: 0) {
                                Text("Category")
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 8)
                                Text("Add a new category to your list")
                                    .font(.system(size: 13, weight: .regular))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 27)
                                TextField("", text: $category)
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(lineWidth: 1).foregroundColor(.white.opacity(0.1))
                                    )
                                    .padding(.horizontal)
                                    .padding(.bottom, 50)
                                
                                HStack {
                                    
                                    Button {
                                        showAddCategory = false
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(height: 34)
                                                .foregroundColor(.white.opacity(0.3))
                                                .cornerRadius(8)
                                            Text("Cancel")
                                                .font(.system(size: 15, weight: .regular))
                                                .foregroundColor(.white)
                                                
                                        }
                                    }
                                    
                                    Button {
                                        if !category.isEmpty {
                                            viewModel.categories.append(category)
                                            showAddCategory = false
                                        }
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(height: 34)
                                                .foregroundColor(.blue)
                                                .cornerRadius(8)
                                            Text("Add")
                                                .font(.system(size: 15, weight: .regular))
                                                .foregroundColor(.white)
                                                
                                        }
                                    }
                                }.padding(.horizontal)
                            }
                                
                        }.frame(height: 260).padding(.horizontal, 50)
                    }
                }
            }
        }
    }
}

#Preview {
    DiscountsUIView(viewModel: DiscountsViewModel())
}
