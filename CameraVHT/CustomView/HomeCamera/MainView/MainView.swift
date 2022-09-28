//
//  MainView.swift
//  CameraVHT
//
//  Created by minhdtn on 13/09/2022.
//

import UIKit

class MainView: UIView {
    //MARK: Properties
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var controlView: ControlView!
    private var videoPlayerViewCenter: CGPoint!
    
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
        let bundle = Bundle.init(for: MainView.self)
        if let viewToAdd = bundle.loadNibNamed("MainView", owner: self, options: nil),
           let contentView = viewToAdd.first as? UIView {
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(contentView)
        }   
    }
}


