//
//  NetworkManager.swift
//  Await
//
//  Created by Eranga Prabath on 2024-06-30.
//

import Foundation
import UIKit

class NetworkManager{
    
  let url = "https://picsum.photos/200"
    
    func handelResponse(data:Data?,response:URLResponse?) -> UIImage?{
        guard
            let data = data,
            let image = UIImage(data: data),
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            return UIImage(systemName: "heart.fill")
        }
        return image
    }
    
    func downloadImageWithEscaping(completionHandeler:@escaping (_ image:UIImage?,_ error:Error?) ->() ){
        guard let url = URL(string: url) else {
            completionHandeler(nil, URLError(URLError.Code.badURL)) 
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error  in
            let image = self?.handelResponse(data: data, response: response)
            completionHandeler(image,error)
        }
        .resume()
    }
    
    func downloadWithAysnc() async throws -> UIImage?{
        guard let url = URL(string: url) else {
            return UIImage(systemName: "car")
        }
        do {
            let (data,response) = try await URLSession.shared.data(from: url, delegate: nil)
            return handelResponse(data: data, response: response)
        } catch  {
            throw error
        }
        
        
        
    }
}
