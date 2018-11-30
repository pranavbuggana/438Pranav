//
//  ViewController.swift
//  eventView
//
//  Created by Pranav Buggana on 11/29/18.
//  Copyright © 2018 Pranav Buggana. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var theCollectionView: UICollectionView!
    
    @IBAction func resetView(_ sender: Any) {
        
        colors = [UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray]
        
        available = [0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0]
        
        theCollectionView.reloadData()
    }
    
    
    var hours:[String] = ["8:00am",    "9:00am",    "10:00am",    "11:00am",    "12:00pm",    "1:00pm",    "2:00pm",    "3:00pm",    "4:00pm",    "5:00pm",    "6:00pm",    "7:00pm",    "8:00pm",    "9:00pm",    "10:00pm",    "11:00pm",    "12:00am"]

    var colors:[UIColor] = [UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray,    UIColor.lightGray]
    
    var available:[Int] = [0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return hours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = theCollectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath) as! timeCell
        
        
        for item in indexPath{
            
            
            cell.theLabel.text! = hours[indexPath.section]
            
            let theKey = cell.theLabel.text!
            
            let idx = hours.index(of: theKey)!
            
            cell.backgroundColor = colors[idx]
            
        }
        
        cell.layer.cornerRadius = 4.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.clear.cgColor

        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = theCollectionView.cellForItem(at: indexPath) as! timeCell

        let idx = hours.index(of: cell.theLabel.text!)!

        if colors[idx] == UIColor.lightGray{
            colors[idx] = UIColor.blue
            available[idx] = 1
        }else{
            colors[idx] = UIColor.lightGray
            available[idx] = 0
        }
        
        theCollectionView.reloadData()

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

