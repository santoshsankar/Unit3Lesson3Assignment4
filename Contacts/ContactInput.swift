//
//  ContactInput.swift
//  Contacts
//
//  Created by Santosh Sankar on 10/10/14.
//  Copyright (c) 2014 Santosh Sankar. All rights reserved.
//

import UIKit

protocol dataUpdated: NSObjectProtocol {
    
    func didUpdateContact(senderClass: AnyObject, aName: String, aPhoneNumber: String)
}

class ContactInput: UIViewController, UITextFieldDelegate {

    
    //Properties
    var name = " "
    var phoneNumber = " "
    var delegate: dataUpdated?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        
        if textField.tag == 1{
            self.name = textField.text
        } else {
            self.phoneNumber = textField.text
        }
        
        // returns keyboard back out of the screen
        textField.resignFirstResponder()
        return true
        
    }
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameField.delegate = self // why did I need to add UITextFieldDelegate to the class?
        self.phoneField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if name != "" && phoneNumber != "" {
            self.delegate!.didUpdateContact(self, aName: self.name, aPhoneNumber: self.phoneNumber)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
