//
//  UserPoolMFAViewController.swift
//  MySampleApp
//
//
// Copyright 2017 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.16
//
//

import Foundation
import AWSMobileHubHelper
import AWSCognitoIdentityProvider

class UserPoolMFAViewController: UIViewController {
    
    var destination: String?
    var authenticationCodeRow: FormTableCell?
    var mfaCodeCompletionSource: AWSTaskCompletionSource<NSString>?
    var tableDelegate: FormTableDelegate?
    
    @IBOutlet weak var tableFormView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var codeSentTo: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.codeSentTo.text = self.destination
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // perform any action, if required, once the view is loaded
        self.setUp()
    }
    
    func setUp() {
        authenticationCodeRow = FormTableCell(placeHolder: "Authentication Code", type: InputType.text)
        tableDelegate = FormTableDelegate()
        tableDelegate?.add(cell: authenticationCodeRow!)
        tableView?.delegate = tableDelegate
        tableView?.dataSource = tableDelegate
        tableView.reloadData()
        UserPoolsUIHelper.setUpFormShadow(view: tableFormView)
        
        self.setUpBackground()
    }
    
    func setUpBackground() {
        self.view.backgroundColor = UIColor.white
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y:0, width: self.view.frame.width, height: self.tableFormView.center.y))
        backgroundImageView.backgroundColor = backgroundImageColor
        backgroundImageView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        self.view.insertSubview(backgroundImageView, at: 0)
    }
    
    @IBAction func onSignIn(_ sender: AnyObject) {
        // check if the user is not providing an empty authentication code 
        guard let authenticationCodeValue = self.tableDelegate?.getValue(tableView, for: authenticationCodeRow!), !authenticationCodeValue.isEmpty else {
            let alert = UIAlertController(title: "Authentication Code Missing",
                                          message: "Please enter the autentication code you received by E-mail / SMS.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion:nil)
            return
        }
        self.mfaCodeCompletionSource?.set(result: authenticationCodeValue as NSString)
    }
    
}

extension UserPoolMFAViewController : AWSCognitoIdentityMultiFactorAuthentication {
    
    func didCompleteMultifactorAuthenticationStepWithError(_ error: Error?) {
        if let localError = error as? NSError {
            DispatchQueue.main.async(execute: {
                let alert = UIAlertController(title: localError.userInfo["__type"] as? String,
                                              message:localError.userInfo["message"] as? String,
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion:nil)
            })
        }
    }
    
    func getCode(_ authenticationInput: AWSCognitoIdentityMultifactorAuthenticationInput, mfaCodeCompletionSource: AWSTaskCompletionSource<NSString>) {
        self.mfaCodeCompletionSource = mfaCodeCompletionSource
        self.destination = authenticationInput.destination
    }
    
}
