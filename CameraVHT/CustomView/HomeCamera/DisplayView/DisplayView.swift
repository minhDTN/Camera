//
//  DisplayView.swift
//  CameraVHT
//
//  Created by minhdtn on 13/09/2022.
//

import UIKit
import MobileVLCKit
protocol DidTapFullScreenBtnDelegate: AnyObject  {
    func didTapFullScreenBtnDelegate(isExpanded: Bool)
}

class DisplayView: UIView, VLCMediaPlayerDelegate {
    //MARK: Properties
    @IBOutlet weak var rightStackBtnLanscape: UIStackView!
    @IBOutlet weak var leftDownStackBtnsLandscape: UIStackView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var playView: UIView!
    @IBOutlet weak var stackViewBtn: UIStackView!
    @IBOutlet weak var eyeSlashBtn: UIButton!
    @IBOutlet weak var timeStatusView: UIView!
    @IBOutlet weak var volumeBtn: UIButton!
    @IBOutlet weak var hdBtn: UIButton!
    @IBOutlet weak var zoomBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var cameraNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    weak var delegate: DidTapFullScreenBtnDelegate?
    var mediaPlayer = VLCMediaPlayer()
    var isExpanded = false
    //MARK: LayoutContraints
    @IBOutlet weak var stackBtnBottomContraint: NSLayoutConstraint!
    @IBOutlet weak var stackBtnBottomContraintLanscape: NSLayoutConstraint!
    @IBOutlet weak var stackBtnTrailingContraint: NSLayoutConstraint!
    @IBOutlet weak var stackBtnTrailingContraintLanscape: NSLayoutConstraint!
    @IBOutlet weak var timeLabelAlignX: NSLayoutConstraint!
    @IBOutlet weak var timeLabelTrailing: NSLayoutConstraint!
    
    //MARK: Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        mediaPlayer.delegate = self
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    //MARK: Helpers
    func configureUI() {
        let bundle = Bundle.init(for: DisplayView.self)
        if let viewToAdd = bundle.loadNibNamed("DisplayView", owner: self, options: nil),
           let contentView = viewToAdd.first as? UIView {
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(contentView)
        }
        playBtn.addTarget(self, action: #selector(touchUpInsidePlayBtn), for: .touchUpInside)
        zoomBtn.addTarget(self, action: #selector(touchUpInsideZoomBtn), for: .touchUpInside)
        leftDownStackBtnsLandscape.isHidden = true
        rightStackBtnLanscape.isHidden = true
        statusLabel.isHidden = true
        statusImage.isHidden = true
        backBtn.isHidden = true
        cameraNameLabel.isHidden = true
    }
    func setUpLayoutForLandscape() {
        stackBtnBottomContraint.priority = UILayoutPriority(750)
        stackBtnBottomContraintLanscape.priority = UILayoutPriority(1000)
        stackBtnTrailingContraint.priority = UILayoutPriority(750)
        stackBtnTrailingContraintLanscape.priority = UILayoutPriority(1000)
        eyeSlashBtn.isHidden = true
        leftDownStackBtnsLandscape.isHidden = false
        rightStackBtnLanscape.isHidden = false
        backBtn.isHidden = false
        cameraNameLabel.isHidden = false
        timeLabelTrailing.priority = UILayoutPriority(250)
        timeLabelAlignX.priority = UILayoutPriority(1000)
        timeLabel.textAlignment = .center
        statusLabel.isHidden = false
        statusImage.isHidden = false
    }
    func setUpLayoutForPortrait() {
        stackBtnBottomContraint.priority = UILayoutPriority(1000)
        stackBtnBottomContraintLanscape.priority = UILayoutPriority(750)
        stackBtnTrailingContraint.priority = UILayoutPriority(1000)
        stackBtnTrailingContraintLanscape.priority = UILayoutPriority(750)
        eyeSlashBtn.isHidden = false
        leftDownStackBtnsLandscape.isHidden = true
        rightStackBtnLanscape.isHidden = true
        backBtn.isHidden = true
        cameraNameLabel.isHidden = true
        timeLabelTrailing.priority = UILayoutPriority(1000)
        timeLabelAlignX.priority = UILayoutPriority(250)
        timeLabel.textAlignment = .right
        statusLabel.isHidden = true
        statusImage.isHidden = true
    }
    //MARK: Actions
    @objc func touchUpInsideZoomBtn() {
        self.delegate?.didTapFullScreenBtnDelegate(isExpanded: isExpanded)
        isExpanded = !isExpanded
    }
    @objc func touchUpInsidePlayBtn() {
        print("DEBUG: Press play button")
        guard let url = URL(string:"http://archive.org/download/SampleMpeg4_201307/sample_mpeg4.mp4") else { return }
        let media = VLCMedia(url: url)
        
        mediaPlayer.libraryInstance.debugLogging = true
        mediaPlayer.libraryInstance.debugLoggingLevel = 3
        mediaPlayer.media = media
        mediaPlayer.drawable = playView
        mediaPlayer.play()
        print("play")
    }
}
