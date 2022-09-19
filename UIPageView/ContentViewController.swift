//
//  ContentViewController.swift
//  UIPageView
//
//  Created by Егор Глезденёв on 07.09.2022.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var presentationTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var finishButton: UIButton!
    
    var presentationText = ""
    var emoji = ""
    var currentPage = 0
    var numberOfPages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentationTextLabel.text = presentationText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPage = currentPage
        finishButton.isHidden = true
        if currentPage == numberOfPages - 1 {
            finishButton.isHidden = false
        }
    }

    @IBAction func finishButtonAction(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "presentationWasViewed")
        dismiss(animated: true, completion: nil)
    }
    
}
