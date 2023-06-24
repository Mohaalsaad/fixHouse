//
//  PaymentButton.swift
//  fixHouse
//
//  Created by Mohammed on 01/12/1444 AH.
//

import SwiftUI
import PassKit


struct PaymentButton: View {
    var action: () -> Void
    
    var body: some View {
        Representable(action: action)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.vertical)
            .background(Color.black)
            .frame(minWidth: 100, maxWidth: 400)
            .frame(height: 45)
            .cornerRadius(16)
            .frame(maxWidth: .infinity)
            .shadow(color: .gray, radius: 2, x: 3, y: 3)
    }
}

struct PaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        PaymentButton(action: {})
    }
}

extension PaymentButton {
    struct Representable: UIViewRepresentable {
        var action: () -> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }
        
        func makeUIView(context: Context) -> UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ rootView: UIView, context: Context) {
            context.coordinator.action = action
        }
    }
    
    class Coordinator: NSObject {
        var action: () -> Void
        var button = PKPaymentButton(paymentButtonType: .book, paymentButtonStyle: .automatic)
        
        init(action: @escaping () -> Void) {
            self.action = action
            super.init()

            button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }
        
        @objc
        func callback(_ sender: Any) {
            action()
        }
    }
}
