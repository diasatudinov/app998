//
//  UsOnboardingUIView.swift
//  app998
//
//  Created by Dias Atudinov on 14.10.2024.
//

import SwiftUI
import StoreKit


struct UsOnboardingUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true
    @State private var isNotificationView: Bool = true
    @State private var pageNum: Int = 1
    @AppStorage("onboardingShowed") var onboardingShowed: Bool = false
    
    var body: some View {
        if !onboardingShowed {
            if pageNum < 3 {
                ZStack {
                    Color.mainBG
                    //                LinearGradient(gradient: Gradient(colors: [.gradientTop, .gradientBottom]),
                    //                               startPoint: .top,
                    //                               endPoint: .bottom)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
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
                        Spacer()
                    }.padding(pageNum == 2 ? 0 : 16)
                    
                    VStack(spacing: 0) {
                        
                        switch pageNum {
                        case 1:
                            VStack {
                                Image("firstScreen998")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width)
                                    .padding(.vertical, -48)
                            }
                        case 2: Image("ratings998")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width)
                                .padding(.top, 42)
                                .padding(.bottom, -120)
                            
                        default:
                            Image("notifications926")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width)
                        }
                        
                        ZStack {
                            Rectangle()
                                .frame(height: UIScreen.main.bounds.height * 0.36)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                            VStack {
                                switch pageNum {
                                case 1:
                                    VStack(spacing: 12) {
                                        Text("Start playing \nand earning")
                                            .font(.system(size: 34, weight: .bold))
                                            .multilineTextAlignment(.center)
                                        Text("A proven way to make easy money")
                                            .font(.system(size: 15))
                                            .multilineTextAlignment(.center)
                                    }.frame(height: 116).padding(.horizontal, 30).foregroundColor(.black).padding(.bottom, 30)
                                    
                                case 2:
                                    VStack(spacing: 12) {
                                        Text("Rate our app \nin the AppStore")
                                            .font(.system(size: 34, weight: .bold))
                                            .multilineTextAlignment(.center)
                                        Text("Help make the app even better")
                                            .font(.system(size: 15))
                                            .multilineTextAlignment(.center)
                                    }.frame(height: 116).padding(.horizontal, 30).foregroundColor(.black).padding(.bottom, 30)
                                        .onAppear{
                                            rateApp()
                                        }
                                default:
                                    Text("Don’t miss anything")
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.black)
                                        .padding(.bottom, 10)
                                    Text("Don’t miss the most userful information")
                                        .foregroundColor(.white).opacity(0.7)
                                    
                                }
                                //Spacer()
                                
                                
                                
                                
                                HStack {
                                    Button {
                                        if pageNum < 3 {
                                            pageNum += 1
                                        } else {
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
                                            
                                            onboardingShowed = true
                                            
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
                if isNotificationView {
                    ZStack {
                        Color.mainBG
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            Image("notifications998")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width)
                        }
                        VStack(spacing: 0) {
                            ZStack {
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
                                
                            }
                            
                            Spacer()
                            
                            ZStack {
                                Rectangle()
                                    .frame(height: UIScreen.main.bounds.height * 0.36)
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                               
                                VStack {
                                    VStack(spacing: 12) {
                                        Text("Manage your orders")
                                            .font(.system(size: 34, weight: .bold))
                                            .multilineTextAlignment(.center)
                                        Text("Don’t miss the most userful information.")
                                            .font(.system(size: 15, weight: .regular))
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                    }.frame(height: 100).padding(.bottom, 50).padding(.horizontal, 30).foregroundColor(.black)
                                    
                                    HStack {
                                        Button {
                                            isNotificationView = false
                                            onboardingShowed = true
                                        } label: {
                                            ZStack {
                                                Rectangle()
                                                    .frame(width:  UIScreen.main.bounds.width * 4/7 , height: 41)
                                                    .foregroundColor(.primaryBlue)
                                                    .cornerRadius(10)
                                                    
                                                Text("Next")
                                                    .foregroundColor(Color.white)
                                                    .font(.system(size: 17, weight: .semibold))
                                                    .frame(maxWidth: .infinity)
                                            }
                                        }
                                        
                                            Button {
                                                
                                                onboardingShowed = true
                                                
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
                                        
                                    }.padding(.horizontal)
                                }
                                
                            }
                        }.edgesIgnoringSafeArea(.bottom)
                        
                        
                    }
                    
                } else {
                    //WebUIView()
                }
            }
        } else {
            // WebUIView()
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                isLoadingView.toggle()
            }
        }
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
}


#Preview {
    UsOnboardingUIView()
}
