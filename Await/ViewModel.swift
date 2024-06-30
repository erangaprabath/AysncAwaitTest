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
    let dataLoader = NetworkManager()
    
    func fetchImages() async{
//        dataLoader.downloadImageWithEscaping { [weak self] image, error in
//            if let image = image{
//                DispatchQueue.main.async {
//                    self?.image = image
//                }
//            }else {
//                print(error ?? "")
//            }
//            
//        }
   
        let image  = try? await dataLoader.downloadWithAysnc()
      await MainActor.run {
          self.image = image
        }
   
    }
}
