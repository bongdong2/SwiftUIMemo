//
//  Compose.swift
//  SwiftUIMemo
//
//  Created by 승의 on 2022/09/14.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store: MemoStore
    
    // 여기에 Memo가 전달되면 edit, nil이면 write
    var memo: Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    
    // 이런걸 State Variable 이라고 합니다.
    @State private var content: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // content 속성을 전달 - two-way binding
                TextEditor(text: $content)
                    .padding()
                    .onAppear() {
                        // 화면이 표시되는 시점에 초기화코드를 넣고 싶다면 여기에 구현
                        if let memo = memo {
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모 편집" : "새 메모")
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
                        if let memo = memo {
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                        
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
