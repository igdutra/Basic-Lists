//
//  UIViewExtensions.swift
//  productListTests
//
//  Created by Renan Silveira on 16/03/21.
//

import UIKit

extension UIView {

    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(frame.size)
            guard let contextImage = UIGraphicsGetCurrentContext() else { return UIImage() }
            layer.render(in: contextImage)
            guard let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else { return UIImage() }
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image)
        }
    }
}
