//
//  ViewModel.swift
//  Await
//
//  Created by Eranga Prabath on 2024-06-30.
//

import Foundation
import SwiftUI

class DownloadImageUsingAsyncViewModel:ObservableObject{
    @Published var image:UIImage? = nil
    
    func fetchImages(){
        self.image = UIImage(systemName: "heart.fill")
    }
}
