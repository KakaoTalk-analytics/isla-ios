//
//  WriteView.swift
//  umemo
//
//  Created by nkstar on 2023/02/16.
//

import SwiftUI

struct WriteView: View {
    @State var text: String
    //@FocusState var isFocus: Bool
    
    var body: some View {
        VStack {
//            TextEditor(text: $text)
//                .multilineTextAlignment(.leading)
//                .focused($isFocus)
//                .onAppear {
//                    self.isFocus = true
//                }
//                .border(.white)
            
            UITextViewRepresentable(text: $text)
                .border(.black)
                
        }
        
    }
}

struct UITextViewRepresentable: UIViewRepresentable {
    let textView = UITextView()
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        textView.delegate = context.coordinator
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        // SwiftUI -> UIKit
        uiView.attributedText = NSMutableAttributedString(string: text)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textViewDidChange(_ textView: UITextView) {
            // UIKit -> SwiftUI
            _text.wrappedValue = textView.text
        }
        
        func textViewDidChangeSelection(_ textView: UITextView) {
            print(textView.selectedRange)
            // TODO: return range to View
//            var attrString = NSMutableAttributedString(string: textView.text)
//            attrString.addAttributes([.font : UIFont.boldSystemFont(ofSize: 30)], range: textView.selectedRange)
//            textView.attributedText = attrString
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(text: "text")
    }
}
