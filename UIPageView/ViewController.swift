//
//  ViewController.swift
//  UIPageView
//
//  Created by Егор Глезденёв on 07.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        let userDefaults = UserDefaults.standard
//        userDefaults.set(false, forKey: "presentationWasViewed")
        
        startPresentation()
    }

    func startPresentation() { 
        let userDefaults = UserDefaults.standard
        let presentationWasViewed = userDefaults.bool(forKey: "presentationWasViewed")
        if presentationWasViewed == false {
            if let pageViewController = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? PageViewController {
                present(pageViewController, animated: true, completion: nil)
            }
        }
    }

}

