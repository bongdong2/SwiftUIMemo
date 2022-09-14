//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by 승의 on 2022/09/14.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
    
    // 프로토콜 설명
    // Identifiable : 데이터를 리스트에 쉽게 바인딩하기 위해 사용
    // ObservableObject : 메모를 편집할 때 뷰를 자동으로 업데이트할 때 필요
    
    let id: UUID
    @Published var content: String // @Published : 새로운 값을 추가할 때마다 바인딩된 Uid? 가 자동으로 업데이트
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
    
}
