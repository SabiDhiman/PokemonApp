//
//  CustomImageView.swift
//  pokapp
//
//  Created by Dhiman, Sabi (Consumer Servicing & Engagement Platform) on 01/03/2023.
//

import UIKit
//save imagas once called
let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImageView: UIImageView {
    var task: URLSessionDataTask!
    func loadImage(from url : URL) {
        
        image = nil
        if let task = task {
            task.cancel()
        }
        //pulling images from the cache
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        //define task
        task = URLSession.shared.dataTask(with: url){
            
            (data, response, error) in
            
            guard
                
                let data = data,
                    
                let newImage = UIImage(data: data) else {
                print("couldnt get image data ")
                return
            }
            //setting imagecache as new image
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            
            DispatchQueue.main.async {
                self.image = newImage
            }
            
        }
        //execute task
        task.resume()
    }
    
}
