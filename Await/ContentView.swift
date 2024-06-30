//
//  ContentView.swift
//  Await
//
//  Created by Eranga Prabath on 2024-06-30.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewmodel = DownloadImageUsingAsyncViewModel()
    var body: some View {
        ZStack{
            if let image = viewmodel.image{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250,height: 250)
            }
        }.padding()
            .onAppear(perform: {
                viewmodel.fetchImages()
            })
    }
}

#Preview {
    ContentView()
}
