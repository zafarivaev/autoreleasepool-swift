//
//  ViewController.swift
//  Autoreleasepool
//
//  Created by Зафар Иваев on 16/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    let queue = DispatchQueue(label: "...")

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
        loadImages()
    }

    func loadImages() {
        let url = URL(string: "https://picsum.photos/200")!
        
        for _ in 0...500 {
            queue.async { [unowned self] in
                autoreleasepool {
                    guard let data = try? Data(contentsOf: url),
                          let image = UIImage(data: data) else {
                              return
                          }
                    
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        }
    }
    
}

