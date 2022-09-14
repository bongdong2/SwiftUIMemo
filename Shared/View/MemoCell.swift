//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by 승의 on 2022/09/14.
//

import SwiftUI

struct MemoCell: View {
    // @ObservableObject : 메모가 업데이트 되는 시점마가 뷰가 업데이트된다.
    @ObservedObject var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1) // 메모 내용을 1줄만 표시 & ...
            
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "test"))
    }
}
