//
//  FolderCell.swift
//  umemo
//
//  Created by vex on 2023/01/10.
//

import Foundation
import SwiftUI

struct FolderCell: View {
    var title: String
    var count: String
    var icon: String
    var body: some View {
        HStack {
            Image(systemName: icon).foregroundColor(Color(hex: "#dba634")).alignmentGuide(.leading, computeValue: { _ in
                0
            })
            Text(title).foregroundColor(Color.black)
            Spacer()
            Text(count).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(Color.gray)
            Image(systemName: "chevron.right").foregroundColor(Color.gray)
        }.frame(maxWidth: .infinity).padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct FolderCell_Previews: PreviewProvider {
    static var previews: some View {
        FolderCell(title: "mockup", count: "224", icon: "folder")
    }
}
