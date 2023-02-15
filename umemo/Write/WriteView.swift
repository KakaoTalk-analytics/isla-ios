//
//  WriteView.swift
//  umemo
//
//  Created by nkstar on 2023/02/16.
//

import SwiftUI

struct WriteView: View {
    @State var text: String
    @FocusState var isFocus: Bool
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .multilineTextAlignment(.leading)
                .focused($isFocus)
                .onAppear {
                    self.isFocus = true
                }
                .border(.white)
        }
        
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(text: "???")
    }
}
