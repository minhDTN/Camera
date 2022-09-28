//
//  HomeCamera.swift
//  CameraVHT
//
//  Created by minhdtn on 15/09/2022.
//

import UIKit

class HomeCamera: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var displayView: DisplayView!
    @IBOutlet weak var mainView: MainView!
    @IBOutlet weak var roundedView: TabbarView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var navigationView: NavigationView!
    private var videoPlayerViewCenter: CGPoint!
    
    //MARK: Layout Contraints
    
    @IBOutlet weak var displayViewBottomLanscapeContraints: NSLayoutConstraint!
    @IBOutlet weak var displayViewTopLanscapeContraints: NSLayoutConstraint!
    @IBOutlet weak var displayViewBottomContraints: NSLayoutConstraint!
    @IBOutlet weak var displayViewTopContraints: NSLayoutConstraint!
    @IBOutlet weak var displayViewAspectRatio: NSLayoutConstraint!
    @IBOutlet weak var shadowViewHeightContraint: NSLayoutConstraint!
    //MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        configureUI()
    }
    //MARK: Helpers
    func configureUI() {
        shadowView.layer.shadowColor = UIColor.opaqueSeparator.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        shadowView.layer.shadowRadius = 8.0
        shadowView.layer.shadowOpacity = 1
        roundedView.frame = shadowView.bounds
        roundedView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        roundedView.layer.cornerRadius = 15
        roundedView.layer.masksToBounds = true
        roundedView.delegate = self
        displayView.delegate = self
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            setUpLayoutForLandscape()
        }
        if UIDevice.current.orientation.isPortrait {
            print("Portrait")
            setUpLayoutForPortrait()
        }
    }
    func setUpLayoutForLandscape() {
        self.view.backgroundColor = .black
        mainView.isHidden = true
        shadowView.isHidden = true
        roundedView.isHidden = true
        navigationView.isHidden = true
        displayView.translatesAutoresizingMaskIntoConstraints = false
        displayViewTopContraints.priority = UILayoutPriority(750)
        displayViewAspectRatio.priority = UILayoutPriority(750)
        displayViewBottomContraints.priority = UILayoutPriority(750)
        displayViewTopLanscapeContraints.priority = UILayoutPriority(1000)
        displayViewBottomLanscapeContraints.priority = UILayoutPriority(1000)
        displayView.setUpLayoutForLandscape()
    }
    func setUpLayoutForPortrait() {
        self.view.backgroundColor = .systemBackground
        mainView.isHidden = false
        shadowView.isHidden = false
        roundedView.isHidden = false
        navigationView.isHidden = false
        displayView.translatesAutoresizingMaskIntoConstraints = false
        displayViewTopContraints.priority = UILayoutPriority(1000)
        displayViewAspectRatio.priority = UILayoutPriority(1000)
        displayViewBottomContraints.priority = UILayoutPriority(1000)
        displayViewTopLanscapeContraints.priority = UILayoutPriority(750)
        displayViewBottomLanscapeContraints.priority = UILayoutPriority(750)
        displayView.setUpLayoutForPortrait()
    }
    
}
//MARK: Extension DidTapFullScreenBtnDelegate
extension HomeCamera: DidTapFullScreenBtnDelegate {
    func didTapFullScreenBtnDelegate(isExpanded: Bool) {
        print("DEBUG: Press zoom button")
        var value  = UIInterfaceOrientation.landscapeRight.rawValue
        if UIDevice.current.orientation.isLandscape {
            value = UIInterfaceOrientation.portrait.rawValue
        }
        
        UIDevice.current.setValue(value, forKey: "orientation")
        UIViewController.attemptRotationToDeviceOrientation()
    }
}
//MARK: Extension DidPressedHiddenButton
extension HomeCamera: DidPressedHiddenButton {
    func hideTabbar() {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.shadowViewHeightContraint.constant = 80
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    func unhideTabbar() {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.shadowViewHeightContraint.constant = 138
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
    }
}
