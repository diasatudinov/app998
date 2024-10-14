//
//  ReOnboardingUIView.swift
//  app998
//
//  Created by Dias Atudinov on 14.10.2024.
//

import SwiftUI

struct ReOnboardingUIView: View {
    @State private var pageNum: Int = 1
    @State private var showSheet = false
    @AppStorage("signedUP") var signedUP: Bool = false
    
    var body: some View {
        if !signedUP {
            ZStack {
                Color.mainBG
//                LinearGradient(gradient: Gradient(colors: [.gradientTop, .gradientBottom]),
//                               startPoint: .top,
//                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    
                    HStack(spacing: 8) {
                        Circle()
                            .fill(pageNum == 1 ? Color.white : Color.white.opacity(0.5))
                            .frame(width: 8, height: 8)
                            .cornerRadius(19)
                        
                        Circle()
                            .fill(pageNum == 2 ? Color.white : Color.white.opacity(0.5))
                            .frame(width: 8, height: 8)
                            .cornerRadius(19)
                        
                        Circle()
                            .fill(pageNum == 3 ? Color.white : Color.white.opacity(0.5))
                            .frame(width: 8, height: 8)
                            .cornerRadius(19)
                    }
                    .padding(8).padding(.horizontal, 4)
                    .background(Color.secondaryBlue)
                    .cornerRadius(50)
                    .padding(.top)
                    
                    switch pageNum {
                    case 1: Image("app998Screen1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                            .padding(.vertical, -48)
                    case 2: Image("app998Screen2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                            .padding(.vertical, -48)
                    case 3: Image("app998Screen3")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                            .padding(.vertical, -48)
                    default:
                        Image("appScreen3")
                            .resizable()
                            .frame(height: 549)
                            .ignoresSafeArea()
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(30)
                        
                        VStack {
                            switch pageNum {
                            case 1:
                                VStack(spacing: 12) {
                                    Text("Statistical analysis")
                                        .font(.system(size: 34, weight: .bold))
                                        .multilineTextAlignment(.center)
                                    Text("See how much you've saved with our \nhandy charts and reports.")
                                        .font(.system(size: 15))
                                        .multilineTextAlignment(.center)
                                }.frame(height: 97).padding(.horizontal, 30).foregroundColor(.black).padding(.bottom, 30)
                            case 2:
                                VStack(spacing: 12) {
                                    Text("Collecting coupons")
                                        .font(.system(size: 34, weight: .bold))
                                        .multilineTextAlignment(.center)
                                    Text("Get notifications and activate \ncoupons in just a few clicks.")
                                        .font(.system(size: 15))
                                        .multilineTextAlignment(.center)
                                }.frame(height: 97).padding(.horizontal, 30).foregroundColor(.black).padding(.bottom, 30)
                            case 3:
                                VStack(spacing: 12) {
                                    Text("Premium Plus")
                                        .font(.system(size: 34, weight: .bold))
                                        .multilineTextAlignment(.center)
                                    Text("Access to unique offers available only \nto Premium Plus members.")
                                        .font(.system(size: 15))
                                        .multilineTextAlignment(.center)
                                }.frame(height: 97).padding(.horizontal, 30).foregroundColor(.black).padding(.bottom, 30)
                            default:
                                Text("Save information about \nyour favorite routes")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .frame(height: 70)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 10)
                                
                            }
                            
                            HStack {
                                Button {
                                    if pageNum < 3 {
                                        withAnimation {
                                            pageNum += 1
                                        }
                                    } else {
                                        signedUP = true
                                    }
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .frame(width: pageNum < 3 ? UIScreen.main.bounds.width * 4/7 : UIScreen.main.bounds.width - 32, height: 41)
                                            .foregroundColor(.primaryBlue)
                                            .cornerRadius(10)
                                            
                                        Text("Next")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 17, weight: .semibold))
                                            .frame(maxWidth: .infinity)
                                    }
                                }
                                
                                if pageNum < 3 {
                                    Button {
                                        
                                        signedUP = true
                                        
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(height: 41)
                                                .foregroundColor(.clear)
                                                .cornerRadius(10)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(lineWidth: 1).foregroundColor(.primaryBlue)
                                                )
                                            Text("Skip")
                                                .foregroundColor(Color.primaryBlue)
                                                .font(.system(size: 17, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                        }
                                    }
                                }
                            }.padding(.horizontal)
                        }
                        
                    }
                    
                    
                }.edgesIgnoringSafeArea(.bottom)
            }
            
        } else {
            //HomeUIView(viewModel: homeVM, orderVM: orderVM)
        }
    }
}


#Preview {
    ReOnboardingUIView()
}
