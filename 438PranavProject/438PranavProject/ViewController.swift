//
//  ViewController.swift
//  438PranavProject
//
//  Created by Pranav Buggana on 11/14/18.
//  Copyright © 2018 Pranav Buggana. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var thePeeps:[schedule]
    
    
    var ref: DatabaseReference!
    var theChild: DatabaseReference!
    let theSched:[String:Bool] = ["0":true,"1":false,"2":false,"3":false]
    var theNameText:String = ""
    var theDayText:String = ""
    
    required init?(coder aDecoder: NSCoder) {
        self.thePeeps = []
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var theDay: UITextField!
    @IBOutlet weak var thePerson: UITextField!
    
    
    @IBAction func overlay(_ sender: Any) {
        
        
        ref.observe(.value) { snapshot in
            
            var allTimes:[[[Int]]] = []
            var allDays:[[String]] = []
            
            for child in snapshot.children {
                
                var theSched:schedule =
                
                let c = child as! DataSnapshot
                var theTimes:[[Int]] = []
                var theDays:[String] = []
                
                for child2 in c.children{
                    let c2 = child2 as! DataSnapshot
                    let key = c2.key
                    if key == "name"{
                        let val = c2.value as! String
                        print("name: \(val)")
                    }else{
                        theDays.append(key)
                    }
                    
                
                    var times:[Int] = []
                    var free:[Int] = []
                for child3 in c2.children{
                    
                    if key != "name"{
                    let c3 = child3 as! DataSnapshot
                    let key = Int(c3.key)
                    let val = c3.value as! Int
                    times.append(key!)
                    free.append(val)
                    
                        
                    }
                    
                }
                    theTimes.append(times)
                    theTimes.append(free)
            }
            
               allDays.append(theDays)
            allTimes.append(Array(theTimes.dropLast(2)))
            }
            let count = allTimes.count
            print("allTimes \(allTimes), \(count)")
            print("\(allDays), \(allTimes)")
            
        }
    }
    
    
    
    @IBAction func theName(_ sender: Any) {
        theNameText = thePerson.text!
    }
    
    @IBAction func dayChanged(_ sender: Any) {
        theDayText = theDay.text!
    }
    
    @IBAction func newPerson(_ sender: Any) {
        ref = Database.database().reference()
        theChild =  ref.childByAutoId()
        theChild.setValue(["name":theNameText])
    }
    
    @IBAction func newDay(_ sender: Any) {
        theChild.child(theDayText).setValue(theSched)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = Database.database().reference()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

