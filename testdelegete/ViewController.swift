//
//  ViewController.swift
//  testdelegete
//
//  Created by JordanLin on 2017/6/29.
//  Copyright © 2017年 JordanLin. All rights reserved.
//

import UIKit

protocol ProductManagerDelegate: class {
    
    func manager(_ manager: ProductManager, didGet products: String)
    
    func manager(_ manager: ProductManager, didFailWith error: Error)
    
}

class ProductManager {

    weak var delegate :ProductManagerDelegate?
    // Add a singleton property here
    
    func requestProducts() {
        
        delegate?.manager(self, didGet: "OK")
        
    }
    
}

class ViewController: UIViewController ,ProductManagerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pm = ProductManager()
        pm.delegate = self
        pm.requestProducts()
        
    }

    func manager(_ manager: ProductManager, didFailWith error: Error) {
        print(error)
    }
    func manager(_ manager: ProductManager, didGet products: String) {
        print(products)
    }
}

