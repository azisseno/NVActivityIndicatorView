//
//  NVActivityIndicatorAnimationBLAnimation.swift
//  NVActivityIndicatorView
//
//  Created by Imaduddin Al Fikri on 12/19/16.
//  Copyright © 2016 Vinh Nguyen. All rights reserved.
//

import Foundation

class NVActivityIndicatorAnimationBLAnimation: NVActivityIndicatorAnimationDelegate {
    private let imagesLayer = CALayer()
    private var images: [UIImage] = []
    var indexOfImages = 2
    
    func loadImages() {
        var images: [UIImage] = []
        for i in 2..<7 {
            if let image = UIImage(named: "ic_loader_\(i)") {
                images.append(image)
            }
        }
        if let image = UIImage(named: "ic_loader_1") {
            images.append(image)
        }
        self.images = images
    }
    
    func setUpAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
        loadImages()
        
        // Draw image layer
        let frame = CGRect(
            x: 0,
            y: 0,
            width: size.width,
            height: size.width
        )
        
        let myImage = UIImage(named: "ic_loader_2")?.cgImage
        imagesLayer.frame = frame
        imagesLayer.contents = myImage
        imagesLayer.backgroundColor = UIColor.white.cgColor
        layer.addSublayer(imagesLayer)
        animate()
    }
    
    private func animate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 0.3, animations: { [weak self] in
                guard let ws = self else { return }
                
                if ws.images.count > ws.indexOfImages {
                    let image = ws.images[ws.indexOfImages]
                    ws.imagesLayer.contents = image
                }
                ws.indexOfImages += 1
                ws.animate()
            })
        }
    }
}
