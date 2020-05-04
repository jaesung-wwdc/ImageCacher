//
//  File.swift
//  
//
//  Created by Jaesung Lee on 2020/05/04.
//

import UIKit

public extension UIImageView {
    func updateImage(urlString: String?) {
        guard let urlString = urlString else { return }
        guard let profileURL = URL(string: urlString) else { return }
        
        ImageCache.shared.load(url: profileURL) { image, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "Failed to load image")
                return
            }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                // If returned image is same as current image
                guard self.image == image else { return }
                self.image = image
                self.layoutIfNeeded()
            }
        }
    }
}
