//
//  TabbarView.swift
//  CameraVHT
//
//  Created by minhdtn on 13/09/2022.
//

import UIKit
protocol DidPressedHiddenButton: AnyObject {
    func hideTabbar()
    func unhideTabbar()
}
enum statusHiddenButton {
    case hide
    case unhide
}
class TabbarView: UIView {
    //MARK: Properties
    @IBOutlet weak var hiddenButton: UIButton!
    @IBOutlet weak var stackTabbarBtn: UIStackView!
    private lazy var checkHiddenButton = statusHiddenButton.unhide
    weak var delegate: DidPressedHiddenButton?
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
        
        let bundle = Bundle.init(for: TabbarView.self)
        if let viewToAdd = bundle.loadNibNamed("TabbarView", owner: self, options: nil),
           let contentView = viewToAdd.first as? UIView {
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(contentView)
        }
        hiddenButton.addTarget(self, action: #selector(pressHiddenBtn), for: .touchUpInside)
    }
    //MARK: Actions
    @objc func pressHiddenBtn() {
        switch checkHiddenButton {
        case .unhide:
            self.delegate?.hideTabbar()
            stackTabbarBtn.isHidden = true
            hiddenButton.setImage(UIImage(named: "Shape-2"), for: .normal)
            checkHiddenButton = .hide
            break
        case .hide:
            self.delegate?.unhideTabbar()
            checkHiddenButton = .unhide
            stackTabbarBtn.isHidden = false
            hiddenButton.setImage(UIImage(named: "Shape-4"), for: .normal)
            break
        }
    }
}
