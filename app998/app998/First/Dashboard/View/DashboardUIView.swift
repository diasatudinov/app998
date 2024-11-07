//
//  DashboardUIView.swift
//  app998
//
//  Created by Dias Atudinov on 15.10.2024.
//

import SwiftUI
import StoreKit

struct DashboardUIView: View {
    
    @ObservedObject var viewModel: DashboardViewModel
    @ObservedObject var discountsVM: DiscountsViewModel
    @State private var editDashboard = false
    var body: some View {
        ZStack {
            Color.mainBG.ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    HStack {
                        Text("Dashboard")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                        Button {
                            editDashboard = true
                        } label: {
                            
                            Image(systemName: "square.and.pencil")
                                .font(.system(size: 34, weight: .bold))
                                .foregroundColor(.secondaryBlue)
                            
                        }
                    }.padding(.bottom, 25)
                    
                    VStack {
                        HStack {
                            
                            Text("🔥")
                                .font(.system(size: 60, weight: .bold))
                            
                            
                            VStack(alignment: .leading) {
                                Text("$\(String(format: "%.1f", viewModel.data.saved))")
                                    .font(.system(size: 34, weight: .bold))
                                    .foregroundColor(.white)
                                Text("Saved with coupons")
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            Spacer()
                        }.padding(.horizontal).frame(maxWidth: .infinity).frame(height: 104).background(Color.white.opacity(0.08)).cornerRadius(16)
                        
                        HStack {
                            
                            Text("❤️")
                                .font(.system(size: 60, weight: .bold))
                            
                            
                            VStack(alignment: .leading) {
                                Text("\(viewModel.data.market)")
                                    .font(.system(size: 34, weight: .bold))
                                    .foregroundColor(.white)
                                Text("Here are the most discounts")
                                    .foregroundColor(.white.opacity(0.7))
                            }
                            Spacer()
                        }.padding(.horizontal).frame(maxWidth: .infinity).frame(height: 104).background(Color.white.opacity(0.08)).cornerRadius(16)
                        
                        VStack(spacing: 20) {
                            
                            Text("These are the coupon categories you used most often")
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(.white)
                            
                            HStack {
                                VStack {
                                    Text("\(String(format: "%.1f", viewModel.data.valueOne))%")
                                        .font(.system(size: 34, weight: .bold))
                                        .foregroundColor(.white)
                                    Text("\(viewModel.data.categoryOne)")
                                        .foregroundColor(.white.opacity(0.7))
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                }.padding(20)//.padding(.horizontal, 14)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 1).foregroundColor(.secondaryBlue)
                                    )
                                
                                VStack {
                                    Text("\(String(format: "%.1f", viewModel.data.valueTwo))%")
                                        .font(.system(size: 34, weight: .bold))
                                        .foregroundColor(.white)
                                    Text("\(viewModel.data.categoryTwo)")
                                        .foregroundColor(.white.opacity(0.7))
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                }.padding(20)//.padding(.horizontal, 14)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(lineWidth: 1).foregroundColor(.secondaryBlue)
                                    )
                            }
                            
                        }.padding(.horizontal).frame(maxWidth: .infinity).frame(height: 214).background(Color.white.opacity(0.08)).cornerRadius(16)
                    }.padding(.bottom, 24)
                    
                    HStack {
                        Text("More")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                        
                    }
                    
                    ScrollView(.horizontal) {
                        HStack {
                            Button {
                                openUsagePolicy()
                            } label: {
                                VStack {
                                    
                                    Image(systemName: "doc.text.magnifyingglass")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 46)
                                        .foregroundColor(.white)
                                        .padding(10).padding(.horizontal, 4)
                                        .background(Color.secondaryBlue)
                                        .cornerRadius(10)
                                    
                                    
                                    Text("Usage Policy")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.white)
                                    
                                }.padding(25).overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(lineWidth: 1).foregroundColor(.secondaryBlue)
                                )
                            }
                            Button {
                                rateApp()
                            } label: {
                                VStack {
                                    
                                    Image(systemName: "star.square")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 46)
                                        .foregroundColor(.white)
                                        .padding(10).padding(.horizontal, 4)
                                        .background(Color.secondaryBlue)
                                        .cornerRadius(10)
                                    
                                    
                                    Text("Rate our app")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.white)
                                    
                                }.padding(25).overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(lineWidth: 1).foregroundColor(.secondaryBlue)
                                )
                            }
                            Button {
                                shareApp()
                            } label: {
                                VStack {
                                    
                                    Image(systemName: "square.and.arrow.up")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 46)
                                        .foregroundColor(.white)
                                        .padding(10).padding(.horizontal, 4)
                                        .background(Color.secondaryBlue)
                                        .cornerRadius(10)
                                    
                                    
                                    Text("Share our app")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundColor(.white)
                                    
                                }.padding(25).overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(lineWidth: 1).foregroundColor(.secondaryBlue)
                                )
                            }
                        }.padding()
                    }.padding(.horizontal, -16)
                    
                    
                }.padding(.horizontal).padding(.top, 40)
                
                NavigationLink {
                    DiscountsUIView(viewModel: discountsVM)
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 90)
                            .cornerRadius(20)
                            .foregroundColor(.primaryBlue)
                        
                        HStack {
                            Text("Go to discounts")
                                .font(.system(size: 17, weight: .medium))
                                .foregroundColor(.white)
                            ZStack {
                                Circle()
                                    .frame(height: 38)
                                    .foregroundColor(.white.opacity(0.3))
                                Image(systemName: "arrow.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 15)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }.padding(.top, 60)
            }.ignoresSafeArea(edges: /*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
                .sheet(isPresented: $editDashboard) {
                    EditDashboard(viewModel: viewModel)
                }
        }
    }
    
    func shareApp() {
        guard let url = URL(string: "https://itunes.apple.com/app/id6737909048") else { return }
        let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityVC, animated: true, completion: nil)
        }
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
    
    func openUsagePolicy() {
        guard let url = URL(string: "https://www.termsfeed.com/live/34bbfca1-94fe-4f4c-bd59-995d9f491f8f") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    DashboardUIView(viewModel: DashboardViewModel(), discountsVM: DiscountsViewModel())
}
