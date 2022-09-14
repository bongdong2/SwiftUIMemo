//
//  MemoStroe.swift
//  SwiftUIMemo
//
//  Created by 승의 on 2022/09/14.
//

import Foundation

class MemoStore: ObservableObject {
    // @Published : 배열을 @Published 특성으로 선언하면 배열을 업데이트할 때마다 바인딩된 뷰도 자동으로 업데이트 된다.
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "Hello", insertDate: Date.now),
            Memo(content: "Awesome", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "SwiftUI", insertDate: Date.now.addingTimeInterval(3600 * -48)),
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }
        
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { ($0.id == memo.id) }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
