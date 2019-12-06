//
//  AuthViewController.swift
//  shlack
//
//  Created by 丸田 on 2019/12/04.
//  Copyright © 2019 畑田将太. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class AuthViewController: UIViewController {

    func createGoogleSigninButton(){
        let googleButton = GIDSignInButton ()
        googleButton.frame = CGRect(x: 20, y: self.view.frame.height/2-30, width: self.view.frame.width-40, height: 60)
        self.view.addSubview(googleButton)
    }
    
     override func viewDidLoad() {
         super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self as GIDSignInDelegate
        GIDSignIn.sharedInstance()?.uiDelegate = self as GIDSignInUIDelegate

         Auth.auth().addStateDidChangeListener { (auth, user) in
             if auth.currentUser == nil{
                 self.createGoogleSigninButton()
             }else{
                 print(auth.currentUser?.uid)
                 print(auth.currentUser?.displayName)
             }
         }
     }

}

extension AuthViewController: GIDSignInDelegate, GIDSignInUIDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let authentication = user.authentication else { return }
        
        //credentialはFirebase登録/ログイン時に必要
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        //Firebase Baas側に認証(初回時はレコードを作成)
        Auth.auth().signIn(with: credential) { (authResult, error) in
        }
        
        //ユーザ情報へのアクセス
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let currentUser = auth.currentUser{
                print(currentUser.uid)
                print(currentUser.displayName)
                print(currentUser.email)
                print(currentUser.photoURL)
                
                //アドレス確認メールの送信
                Auth.auth().currentUser?.sendEmailVerification { (error) in
                }
            }
        }
    }
}
