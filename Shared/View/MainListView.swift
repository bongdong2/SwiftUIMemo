//
//  MailListView.swift
//  SwiftUIMemo
//
//  Created by 승의 on 2022/09/14.
//

import SwiftUI

struct MainListView: View {
    // 하나의 데이터를 여러 뷰에서 공유하고 싶을 떄 이런 방식으로 사용합니다.
    @EnvironmentObject var store: MemoStore
    
    // Compose View를 표시할 때 사용한다.
    @State private var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                MemoCell(memo: memo)
                // 뷰가 가독성이 떨어져서 서브뷰로 분리한다.
                // Cmd + shift + A -> Extract Subview -> 새파일 생성하여 옮기기
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
            .toolbar {
                // '+' 버튼을 오른쪽에 바로 추가하니까 ToolbarItemGroup 사용 안 하겠음
                Button {
                    showComposer = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            // sheet 모디파이더는 바인딩 속성에 true가 전달되면 내부 클로저가 실행되고 클로저에서 리턴한 뷰를 모달방식으로 표시해준다.
            // 바인딩을 전달할 때는 딸라($) 문자열로 전달해야 한다.
            .sheet(isPresented: $showComposer) {
                ComposeView()
            }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
