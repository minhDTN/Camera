//
//  NavigationView.swift
//  CameraVHT
//
//  Created by minhdtn on 08/09/2022.
//

import UIKit

class NavigationView: UIView {
    
    //MARK: Properties
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var cornerView: UIView!
    //MARK: Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    //MARK: Helpers
    func configureUI() {
      
        let bundle = Bundle.init(for: NavigationView.self)
        if let viewToAdd = bundle.loadNibNamed("NavigationView", owner: self, options: nil),
           let contentView = viewToAdd.first as? UIView {
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(contentView)
        }
        //contentView.addSubview(settingsButton)
        cornerView.clipsToBounds = true
        cornerView.layer.cornerRadius = 20
        cornerView.layer.maskedCorners = [.layerMinXMinYCorner]
        //viewContainer.configureGradientLayer(colors: [UIColor.navigationViewColor1, UIColor.navigationViewColor2, UIColor.navigationViewColor3, UIColor.navigationViewColor4], locations: [0.3, -0.1,  0.8, 1])
        viewContainer.backgroundColor = UIColor.navigationViewColor2
        
    }
}

