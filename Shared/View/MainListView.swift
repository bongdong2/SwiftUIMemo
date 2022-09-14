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
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                MemoCell(memo: memo)
                // 뷰가 가독성이 떨어져서 서브뷰로 분리한다.
                // Cmd + shift + A -> Extract Subview -> 새파일 생성하여 옮기기
            }
            .listStyle(.plain)
            .navigationTitle("내 메모")
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
