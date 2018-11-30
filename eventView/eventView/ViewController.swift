//
//  ViewController.swift
//  eventView
//
//  Created by Pranav Buggana on 11/29/18.
//  Copyright © 2018 Pranav Buggana. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var theCollectionView: UICollectionView!
    
    var hours:[String] = ["8:00am",    "9:00am",    "10:00am",    "11:00am",    "12:00am",    "1:00am",    "2:00am",    "3:00am",    "4:00am",    "5:00am",    "6:00am",    "7:00am",    "8:00am",    "9:00am",    "10:00am",    "11:00am",    "12:00am"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return hours.count
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =
        
        for item in indexPath{
            
            cell.text.text! = hours[item]
            
            }
        
        return cell
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        theCollectionView.dataSource = self
        theCollectionView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

