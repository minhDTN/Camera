//
//  FunctionView.swift
//  CameraVHT
//
//  Created by minhdtn on 13/09/2022.
//

import UIKit

class FunctionView: UIView {
    //MARK: Properties
    
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
        let bundle = Bundle.init(for: FunctionView.self)
        
        if let viewToAdd = bundle.loadNibNamed("FunctionView", owner: self, options: nil),
           let contentView = viewToAdd.first as? UIView {
            
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(contentView)
        }
    }
}
