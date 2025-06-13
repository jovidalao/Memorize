//
//  ContentView.swift
//  Memorize
//
//  Created by jovi on 12/6/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white)
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(lineWidth: 2)
            if isFaceUp {
                Text("🙈").font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: 12)
            }
            
        }
    }
}


#Preview {
    ContentView()
}
