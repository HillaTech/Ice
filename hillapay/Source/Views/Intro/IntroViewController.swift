//
//  IntroViewController.swift
//  hillapay
//
//  Created by Mahdi on 6/11/19.
//  Copyright © 2019 Mahdi. All rights reserved.
//

import UIKit

class IntroViewController: UIPageViewController {
    
    var pageControl = UIPageControl()
    
    fileprivate lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController(imageName: "slides_1"),
                self.newColoredViewController(imageName: "slides_2"),
                self.newColoredViewController(imageName: "slides_3"),
                self.newColoredViewController(imageName: "slides_4")]
    }()
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        configPageControl()
        configButton()
        
    }
    
    private func newColoredViewController(imageName: String) -> UIViewController {
        
        let vc = ChildViewController()
        vc.image = UIImage(named: imageName)
        return vc
    }
    
    func configPageControl() {
        
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 70,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.white
        self.pageControl.pageIndicatorTintColor = UIColor.lightGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.white
        self.view.addSubview(pageControl)
    }
    
    func configButton() {
        
        let XPosition = self.view.bounds.maxX - 100
        let YPosition = self.view.bounds.maxY - 70
        let button = CButton(frame: CGRect(x: XPosition, y: YPosition, width: 80, height: 50))
        button.backgroundColor = UIColor.PRIMARY_5
        button.setTitle("ورود", for: .normal)
        button.cornerRadius = 25
        button.titleLabel?.font = FontHandler.getRegular(size: 16)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        
        let Login = LoginStep1ViewController()
        Login.modalTransitionStyle = .crossDissolve
        self.present(Login, animated: true, completion: nil)
    }

}

// MARK: UIPageViewControllerDataSource

extension IntroViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    override var transitionStyle: UIPageViewController.TransitionStyle {
        return .scroll
    }
    
    override var navigationOrientation: UIPageViewController.NavigationOrientation {
        return .horizontal
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
}
