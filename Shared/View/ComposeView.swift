//
//  Compose.swift
//  SwiftUIMemo
//
//  Created by 승의 on 2022/09/14.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    @Environment(\.dismiss) var dismiss
    
    // 이런걸 State Variable 이라고 합니다.
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // content 속성을 전달 - two-way binding
                TextEditor(text: $content)
                    .padding()
            }
            .navigationTitle("새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // 바로 버튼을 추가하면 오른쪽에 버튼이 생성되므로 그룹을 만든다.
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    // 버튼을 클릭하면 화면을 닫을건데 여기서는 dismiss를 사용한다.
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        store.insert(memo: content)
                        dismiss()
                    } label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}

struct ComposeView_Previews: PreviewProvider {
    static var previews: some View {
        ComposeView()
            .environmentObject(MemoStore())
    }
}
