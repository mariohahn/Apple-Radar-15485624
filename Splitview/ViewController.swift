//
//  ViewController.swift
//  Splitview
//
//  Created by Mario Hahn on 24.09.19.
//  Copyright © 2019 Mario Hahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let show: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("show error", for: .normal)
        
        return $0
    }(UIButton(type: .system))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        show.addTarget(self, action: #selector(showAction), for: .primaryActionTriggered)
        
        view.addSubview(show)
        
        NSLayoutConstraint.activate([
            show.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            show.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func showAction() {
        let test0ViewController = UIViewController()
        test0ViewController.view.backgroundColor = .red
        
        let test1ViewController = UIViewController()
        test1ViewController.view.backgroundColor = .green
        test1ViewController.title = "Title"
        test1ViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        test1ViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)

        let testNavigationController = UINavigationController(rootViewController: test1ViewController)
        
        
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [test0ViewController, testNavigationController]
        
        present(splitViewController, animated: true, completion: nil)
    }
}

