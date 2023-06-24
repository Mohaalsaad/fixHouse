//
//  OnboardingView.swift
//  fixHouse
//
//  Created by Mohammed on 23/11/1444 AH.
//

import SwiftUI


struct OnboardingStruct{
    var image : String
    var text : String
}

struct OnboardingView: View {
   @State var current = 0
    let myOnBoardings = [
        OnboardingStruct(image: "onbo1" , text: "Welcome to your new application for home maintenance, you will discover many services with us."),
        OnboardingStruct(image: "onbo2" , text: "We provide you with many periodic maintenance such as cleaning air conditioners, repairing home appliances, etc."),
        OnboardingStruct(image: "onbo3" , text: "Explore the application yourself to see many services to facilitate our daily lives.")
    ]
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    TabView(selection: $current){
                        ForEach(0..<3) { boarding in
                            VStack{
                                Image(myOnBoardings[boarding].image)
                                    .resizable()
                                    .frame(width: 300 , height: 300)
                                Text(myOnBoardings[boarding].text)
                                    .font(.custom("Montserrat-Bold",fixedSize:20))
                                    .multilineTextAlignment(.center)
                                    .padding()
                                
                            }
                        }
                       
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .edgesIgnoringSafeArea(.vertical)
                    
                    
                    HStack{
                        ForEach(0 ..< 3){ i in
                            if i == current {
                                Rectangle()
                                    .frame(width: 20 , height: 10)
                                    .cornerRadius(10)
                                    .foregroundColor(Color("Color2"))
                                
                            } else {
                                Circle()
                                    .frame(width: 10 , height: 10)
                                    .foregroundColor(Color("Color3"))
                            }
                            
                        }
                    }
                    
                    NavigationLink {
                       BeganPage()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Sign up ")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Color2"))
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 2, x: 3, y: 3)
                    }.padding()
                    
                    
                    NavigationLink {
                       BeganPage()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Skip")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }.padding()
                   
                }
                
            }
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

