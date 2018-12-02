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
    
    var master: [[String]] = []
    var masterKey:String = ""
    var ref: DatabaseReference!
    var theChild: DatabaseReference!
    
    let theMaster:[[String]] = [["Donald,Hillary,Bernie","","LittleMarco"],["","Ocasio",""],["Zodiac,TedCruz","","Ivanka"],["Obama","","Romney"]]
    
    var theNameText:String = ""

    let newPerson = event(name: "test", times: [[1,1,0],[1,0,1],[0,0,0],[0,1,1]])
    
    @IBOutlet weak var theDay: UITextField!
    @IBOutlet weak var thePerson: UITextField!
    
    
    @IBAction func overlay(_ sender: Any) {
        
        let theTimes = newPerson.times
        let name = newPerson.name
        
        pullJson()
        
        for i in 0..<master.count{
            for j in 0..<master[i].count{
                if theTimes[i][j] == 1{
                    if master[i][j] == ""{
                        master[i][j] = master[i][j] + name
                    }
                    else{master[i][j] = master[i][j] + "," + name
                    }
                }
            }
        }
        
        theChild = ref.child(masterKey)
        theChild.setValue(master)
        
    }
    
    
    
    @IBAction func theName(_ sender: Any) {
        theNameText = thePerson.text!
    }
    
    
    
    @IBAction func newPerson(_ sender: Any) {
        
        ref = Database.database().reference()
        theChild =  ref.childByAutoId()
        theChild.setValue(theMaster)
        theChild.child("name").setValue(theNameText)
        
    }
    
    func pullJson(){
        
        
        ref.observe(.value) { snapshot in
            
           
            for child in snapshot.children {
                
                
                let c = child as! DataSnapshot

                self.masterKey = c.key
                
                for child2 in c.children{
                    let c2 = child2 as! DataSnapshot
                    let key = c2.key
                    
                    
                    
                    var avail:[String] = []
                    for child3 in c2.children{
                        
                        if key != "name"{
                            let c3 = child3 as! DataSnapshot
                            let val = c3.value as! String
                            avail.append(val)
                            
                            
                        }
                        
                    }
                    if key == "name"{
                    }else{
                    if self.master.count == 0{
                    self.master += [avail]
                    }else{
                        self.master.append(avail)
                    }
                    }
                }
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = Database.database().reference()
        pullJson()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

