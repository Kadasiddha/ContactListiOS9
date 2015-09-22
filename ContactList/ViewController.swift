//
//  ViewController.swift
//  ContactList
//
//  Created by Kadasiddha Kullolli on 21/09/15.
//  Copyright © 2015 Kadasiddha Kullolli. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController, CNContactPickerDelegate {

    
    @IBOutlet weak var showContactList: UIButton!
    @IBOutlet weak var PhoneNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showContactList.layer.cornerRadius = 3
                      // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ShowContactList(sender: AnyObject) {
        
        let store = CNContactStore()
        switch CNContactStore.authorizationStatusForEntityType(.Contacts){
        case .Authorized: break
            //createContact()
        case .NotDetermined:
            store.requestAccessForEntityType(.Contacts){succeeded, err in
                guard err == nil && succeeded else{
                    return
                }
                //self.createContact()
            }
        default:
            print("Not handled")
        }
        let peoplePicker = CNContactPickerViewController()
         peoplePicker.delegate = self
        peoplePicker.displayedPropertyKeys = [CNContactPhoneNumbersKey]
        
        
     
        
       
        self.presentViewController(peoplePicker, animated: true, completion: nil)
      
        
    }
 
    func contactPickerDidCancel(picker: CNContactPickerViewController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
   
    
    func contactPicker(picker: CNContactPickerViewController, didSelectContactProperty contactProperty: CNContactProperty) {
    

    
        print(contactProperty.identifier)
         if contactProperty.contact.phoneNumbers.count >= 1
        {
           

        
            for contactvalue in contactProperty.contact.phoneNumbers {
                let actualNumber = contactvalue.value as! CNPhoneNumber
                
                if contactProperty.identifier == contactvalue.identifier
                {
                    
                    var phonenumber = "\(actualNumber.stringValue)"
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("-", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("(", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString(")", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("*", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("+", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("=", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("!", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("@", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("#", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("$", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("%", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("^", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    phonenumber = phonenumber.stringByReplacingOccurrencesOfString("&", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                    print(phonenumber)
                    PhoneNumberTextField.text = phonenumber
                    
                }
            }
        }
        else{
        }
    }
    }

