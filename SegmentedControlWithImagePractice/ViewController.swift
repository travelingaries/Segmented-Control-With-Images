//
//  ViewController.swift
//  SegmentedControlWithImagePractice
//
//  Created by Edward Joon-Hyuk Chang on 06/11/2016.
//  Copyright © 2016 EdwardChang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Create UISegmentedControl
    lazy var control: UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.translatesAutoresizingMaskIntoConstraints = false
        
        //Set color
        sc.backgroundColor = UIColor.white
        sc.tintColor = UIColor.black
        
        //Insert indices
        sc.insertSegment(with: UIImage(named: "findFriends"), at: 0, animated: false)
        sc.insertSegment(with: UIImage(named: "settings"), at:1, animated: false)
        
        //Index selected as default:
        sc.selectedSegmentIndex = 0
        
        //Add action
        sc.addTarget(self, action: #selector(handleChange), for: .valueChanged)
        
        //Optional: Call custom code to remove borders
        //sc.removeBorders()
        
        return sc
    }()
    
    func handleChange() {
        /* Code to run when a certain index is selected */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        view.addSubview(control)
        control.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        control.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        control.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        control.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
}

//Extension to remove outer border and divider
extension UISegmentedControl {
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor!), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x:0.0, y:0.0, width:1.0, height:1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
