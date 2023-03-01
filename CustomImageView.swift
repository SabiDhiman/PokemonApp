//
//  CustomImageView.swift
//  pokapp
//
//  Created by Dhiman, Sabi (Consumer Servicing & Engagement Platform) on 01/03/2023.
//

import UIKit


class CustomImageView: UIImageView {
    
    func loadImage(from url : URL) {
        image = nil
        //define task
        let task = URLSession.shared.dataTask(with: url){
            
            (data, response, error) in
            
            guard
                
                let data = data,
                    
                let newImage = UIImage(data: data) else {
                print("couldnt get image data ")
                return
            }
            DispatchQueue.main.async {
                self.image = newImage
            }
            
        }
        //execute task
        task.resume()
    }
    
}
