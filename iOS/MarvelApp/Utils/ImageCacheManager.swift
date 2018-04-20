//
//  CachedImageLoader.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation
import UIKit

typealias ImageCacheManagerCompletionHandler = ((UIImage) -> Void)

class ImageCacheManager {
    
    static let shared = ImageCacheManager()
    
    private var downloadTask: URLSessionDownloadTask!
    private var urlSession: URLSession!
    private var imageCache: NSCache<NSString, UIImage>!
    private var placeholderImages: [UIImage]!
    
    private init() {
        urlSession = URLSession.shared
        downloadTask = URLSessionDownloadTask()
        imageCache = NSCache()
        placeholderImages = [UIImage]()
        placeholderImages.append(UIImage(named: "MarvelPlaceholder1")!)
        placeholderImages.append(UIImage(named: "MarvelPlaceholder2")!)
        placeholderImages.append(UIImage(named: "MarvelPlaceholder3")!)
        placeholderImages.append(UIImage(named: "MarvelPlaceholder4")!)
        NotificationCenter.default.addObserver(self, selector: #selector(emptyCache), name: .UIApplicationDidReceiveMemoryWarning, object: nil)
    }
    
    @objc private func emptyCache() {
        imageCache.removeAllObjects()
    }
    
    func getImage(imageUrl: URL, completionHandler: @escaping ImageCacheManagerCompletionHandler) {
        if let image = self.imageCache.object(forKey: imageUrl.lastPathComponent as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            DispatchQueue.main.async {
                completionHandler(self.placeholderImages.randomElement()!)
            }
            downloadTask = urlSession.downloadTask(with: imageUrl, completionHandler: { (location, _, _) in
                if let data = try? Data(contentsOf: location!) {
                    let image: UIImage! = UIImage(data: data)
                    self.imageCache.setObject(image, forKey: imageUrl.lastPathComponent as NSString)
                    DispatchQueue.main.async {
                        completionHandler(image)
                    }
                }
            })
            downloadTask.resume()
        }
    }
}
