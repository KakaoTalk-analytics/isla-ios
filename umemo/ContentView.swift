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
    var folderList: Array<MockupHeader> = [
        MockupHeader(name: "iCloud", cellData: [
            MockupCellData(name: "모든 iCloud", count: "100", icon: "folder"),
            MockupCellData(name: "쥬라기 공원", count: "101", icon: "folder"),
            MockupCellData(name: "매트릭스", count: "102", icon: "folder"),
            MockupCellData(name: "스타워즈", count: "103", icon: "folder"),
            MockupCellData(name: "탑건", count: "104", icon: "folder"),
            MockupCellData(name: "반지의제왕", count: "105", icon: "folder"),
            MockupCellData(name: "최근 삭제된 항목", count: "8", icon: "trash")
        ]),
    ]
    @State private var folderName: String = ""
    @State private var isFolderPresenting: Bool = false
    @State private var isCreatePresenting: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                List(folderList) {data in
                    Section {
                        ForEach(data.cellData) { list in
                            NavigationLink(destination: MemoList(title: list.name)) {
                                FolderCell(title: list.name, count: list.count, icon: list.icon)
                            }
                        }
                    } header: {
                        Text("iCloud").font(.headline).foregroundColor(Color.black).textCase(nil)
                    }.accentColor(Color(hex: "#dba634"))
                }.listStyle(.automatic).navigationTitle(Text("Folders")).navigationBarTitleDisplayMode(.automatic).overlay(SearchWidget(text: $folderName, searchResultsContent: {
                    
                }).frame(width: 0, height: 0))
            }.toolbar {
                 ToolbarItem(placement: .automatic) {
                     Button {
                         
                     } label: {
                         Text("Edit").foregroundColor(Color(hex: "#dba634"))
                     }
                     
                 }
                 
                 ToolbarItemGroup(placement: .bottomBar) {
                     Button(action: {
                         self.isFolderPresenting.toggle()
                     }) {
                        Image(systemName: "folder.badge.plus").foregroundColor(Color(hex: "#dba634"))
                     }.sheet(isPresented: $isFolderPresenting) {
                         Text("폴더 생성 View")
                     }
                     
                     
                     Button(action: {
                         self.isCreatePresenting.toggle()
                     }) {
                        Image(systemName: "square.and.pencil").foregroundColor(Color(hex: "#dba634"))
                     }.sheet(isPresented: $isCreatePresenting) {
                         Text("메모 작성 View")
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
