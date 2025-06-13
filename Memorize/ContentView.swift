//
//  ContentView.swift
//  Memorize
//
//  Created by jovi on 12/6/2025.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🙈", "🤗","😄","😁","😈","🙈", "🤗","😄","😁","😈"]
    @State var CardCount: Int = 4
    var body: some View {
        ScrollView{
            Cards
        }
        Spacer()
        CardAdjusters
    }
    var CardAdjusters: some View {
        HStack {
            CardRemover
            Spacer()
            CardAdder
        }
        .font(.title).padding()
    }
    var Cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<CardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
        .padding()
    }
    func CardAdjuster(by offset: Int, symbol: String) -> some View{
        Button(
            action : {
                CardCount += offset
            },label : {
                Image(systemName:symbol)
            }
        )
        .disabled(CardCount + offset < 1 || CardCount + offset > emojis.count)
    }
    
    var CardRemover: some View {
        CardAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    var CardAdder: some View {
        CardAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    let content: String
    
    let base = RoundedRectangle(cornerRadius: 12)
    var body: some View {
        ZStack {
            if isFaceUp {
                base.fill(.white)
                    .strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }else{
                Text(content).font(.largeTitle)
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}


#Preview {
    ContentView()
}
