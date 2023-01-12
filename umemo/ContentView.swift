//
//  ContentView.swift
//  umemo
//
//  Created by 한승재 on 2022/12/08.
//

import SwiftUI

struct MockupCellData: Identifiable {
    let name: String
    let count: String
    let icon: String
    let id = UUID()
}

struct MockupHeader: Identifiable {
    let name: String
    let cellData: Array<MockupCellData>
    let id = UUID()
}

struct ContentView: View {
    var list: Array<MockupCellData> = [
        MockupCellData(name: "모든 iCloud", count: "100", icon: "folder"),
        MockupCellData(name: "쥬라기 공원", count: "101", icon: "folder"),
        MockupCellData(name: "매트릭스", count: "102", icon: "folder"),
        MockupCellData(name: "스타워즈", count: "103", icon: "folder"),
        MockupCellData(name: "탑건", count: "104", icon: "folder"),
        MockupCellData(name: "반지의제왕", count: "105", icon: "folder")
    ]
    
    var headerList: Array<MockupHeader> = [
        MockupHeader(name: "iCloud", cellData: [
            MockupCellData(name: "모든 iCloud", count: "100", icon: "folder"),
            MockupCellData(name: "쥬라기 공원", count: "101", icon: "folder"),
            MockupCellData(name: "매트릭스", count: "102", icon: "folder"),
            MockupCellData(name: "스타워즈", count: "103", icon: "folder"),
            MockupCellData(name: "탑건", count: "104", icon: "folder"),
            MockupCellData(name: "반지의제왕", count: "105", icon: "folder")
        ]),
        MockupHeader(name: "영화", cellData: [
            MockupCellData(name: "모든 iCloud", count: "100", icon: "folder"),
            MockupCellData(name: "쥬라기 공원", count: "101", icon: "folder"),
            MockupCellData(name: "매트릭스", count: "102", icon: "folder"),
            MockupCellData(name: "스타워즈", count: "103", icon: "folder"),
            MockupCellData(name: "탑건", count: "104", icon: "folder"),
            MockupCellData(name: "반지의제왕", count: "105", icon: "folder")
        ])
    ]
    
    var body: some View {
        NavigationView {
            List(headerList) {data in
                Section {
                    ForEach(data.cellData) { list in
                        FolderCell(title: list.name, count: list.count, icon: list.icon)
                    }
                } header: {
                    Text(data.name)
                }
            }.listStyle(.automatic).navigationTitle(Text("Folders"))
             .navigationBarTitleDisplayMode(.automatic)
             .toolbar {
                 ToolbarItem(placement: .automatic) {
                     Button {

                     } label: {
                         Text("Edit").foregroundColor(Color(hex: "#dba634"))
                     }
                 }
                 
                 ToolbarItemGroup(placement: .bottomBar) {
                     Button(action: {
                         
                     }) {
                        Image(systemName: "folder.badge.plus").foregroundColor(Color(hex: "#dba634"))
                     }
                     
                     Button(action: {
                         
                     }) {
                        Image(systemName: "square.and.pencil").foregroundColor(Color(hex: "#dba634"))
                     }
                 }
             }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
