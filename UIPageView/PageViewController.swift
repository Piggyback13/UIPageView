//
//  PageViewController.swift
//  UIPageView
//
//  Created by Егор Глезденёв on 07.09.2022.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentationScreenContent = [
        "First page of the presentation that tells about what the application is",
        "Second page of the presentation that tells about the convenient features of the application",
        "Third page of the presentation that tells about something interesting",
        "Finally, last page of the presentation that wishes good luck :)"
    ]
    
    let emojiArray = ["😉", "🤓", "🧐", "🫡"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self

        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < presentationScreenContent.count else {
            return nil
        }
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        
        contentViewController.presentationText = presentationScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPages = presentationScreenContent.count
        
        return contentViewController
    }

}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
}
