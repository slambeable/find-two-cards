//
//  UIAlertController+Image.swift
//  FindTwoCards
//
//  Created by Богдан Олейник on 01.03.2022.
//

import UIKit

extension UIAlertController {
    func addImage(image: UIImage) {
        let maxSize = CGSize(width: 245, height: 300)
        let imgSize = image.size
        
        var ratio: CGFloat!
        if (imgSize.width > imgSize.height) {
            ratio = maxSize.width / imgSize.width
        } else {
            ratio = maxSize.height / imgSize.height
        }
        
        let scaledSize = CGSize(width: imgSize.width * ratio, height: imgSize.height * ratio)
        
        // let resizedImage = image.imageWithSize(scaledSize)
        let renderer = UIGraphicsImageRenderer(size: scaledSize)
        let scaledImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: scaledSize))
        }

        let imgAction = UIAlertAction(title: "", style: .default, handler: nil)
        imgAction.isEnabled = false
        imgAction.setValue(scaledImage.withRenderingMode(.alwaysOriginal), forKey: "image")
        self.addAction(imgAction)
    }
}
