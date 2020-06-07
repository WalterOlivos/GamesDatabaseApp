//
//  UIImageView+LoadURL.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL, completion: @escaping (UIImage) -> ()) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        self?.heightAnchor.constraint(equalToConstant: CGFloat(170)).isActive = true
                        completion(image)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self?.heightAnchor.constraint(equalToConstant: CGFloat(0)).isActive = true
                }
            }
        }
    }
}
