//
//  MainViewController.swift
//  FirebasePhun
//
//  Created by Patrick Paechnatz on 18.04.17.
//  Copyright © 2017 Patrick Paechnatz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class MainViewController: UIViewController {
    
    fileprivate var _refHandle: FIRDatabaseHandle!
    fileprivate var _authHandle: FIRAuthStateDidChangeListenerHandle!
    
    var user: FIRUser?
    var userDisplayName = "Anonymous"

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear( animated )
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear( animated )
        
        FIRAuth.auth()?.removeStateDidChangeListener(_authHandle!)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    func handleAuth() -> Void {
        
        // add google auth as additional auth provider
        let provider: [FUIAuthProvider] = [FUIGoogleAuth()]
        FUIAuth.defaultAuthUI()?.providers = provider
        
        // listen for changes in the authorization state
        _authHandle = FIRAuth.auth()?.addStateDidChangeListener { (auth: FIRAuth, user: FIRUser?) in
            
            // check if there is a current (active) user
            if let activeUser = user {
                
                if self.user != activeUser {
                    
                    self.user = activeUser
                    self.signedInStatus( true )
                    self.userDisplayName = user!.email!.components(separatedBy: "@")[0]
                }
                
            } else {
                
                self.signedInStatus( false )
                self.handleLoginSession()
            }
        }
    }
    
    func handleLoginSession() {
        
        let authViewController = FUIAuth.defaultAuthUI()!.authViewController()
        present(authViewController, animated: true, completion: nil)
    }
    
    func signedInStatus(_ isSignedIn: Bool) {
        
        if isSignedIn {
            
            print ("User IS authenticated now")
            print ("-------------------------")
            print (user)
            
            // configureDatabase()
            // configureStorage()
            // configureRemoteConfig()
            // fetchConfig()
            
        } else {
            
            print ("User authentication failed !!!")
            print ("------------------------------")
            
        }
    }
}

