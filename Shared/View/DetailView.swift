//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by 승의 on 2022/09/14.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    // @ObservedObject 사용하면 Memo에 있는 @Published로 선언된 값이 변경되면 뷰가 자동으로 업데이트 된다.
    
    @EnvironmentObject var store: MemoStore
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    // SwiftUI 레이아웃을 기본적으로 가운데정렬이다.
                    // HStack과 Spacer를 사용해서 왼쪽정렬한다.
                    HStack {
                        Text(memo.content)
                            .padding()
                        Spacer(minLength: 0)
                    }
                    
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("메모 보기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: Memo(content: "Hello"))
            .environmentObject(MemoStore())
    }
}
