//
//  test.swift
//  fixHouse
//
//  Created by Mohammed on 28/11/1444 AH.
//

import SwiftUI

struct test: View {
    @State private var selectedDate = Date()
    @State private var showDatePicker = false
        var body: some View {
            VStack {
                HStack {
                    Text("Date is \(selectedDate.formatted(date: .long, time: .shortened))")
                    Spacer()
                    Button {
                        withAnimation {
                            showDatePicker.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "calendar")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 30, height: 30)
                            .padding(.trailing)
                    }
                    
                }  
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 2, y: 1)
                
                    
                if showDatePicker {
                    withAnimation {
                        DatePicker(
                            "",
                            selection: $selectedDate,
                            displayedComponents: .date
                        )
                        .labelsHidden()
                        .datePickerStyle(.graphical)
                        .frame(maxHeight: 400)
                        .transition (.asymmetric(insertion: .scale, removal: .opacity))
                        
                    }
                }
                
             Spacer()
            }
            
        }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
