//
//  ControlView.swift
//  CameraVHT
//
//  Created by minhdtn on 13/09/2022.
//


import UIKit

class ControlView: UIView {
    //MARK: Properties
    @IBOutlet weak var centerControlBtn: UIView!
    @IBOutlet var boundView: UIView!
    
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
        let bundle = Bundle.init(for: ControlView.self)
        if let viewToAdd = bundle.loadNibNamed("ControlView", owner: self, options: nil),
           let contentView = viewToAdd.first as? UIView {
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(contentView)
        }
        centerControlBtn.layer.cornerRadius = 60/2
        self.layer.cornerRadius = 118/2
    }
}
