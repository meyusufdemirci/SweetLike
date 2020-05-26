//
//  SweetLike.swift
//  SweetLike
//
//  Created by Yusuf Demirci on 7.07.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

public enum SweetLikeStatus {
    case liked, unliked
}

@IBDesignable public class SweetLike: UIView {
    
    // MARK: - UI Properties
    public var likeButton: UIButton!
    public var unlikeButton: UIButton!
    
    // MARK: - IBInspectable Properties
    @IBInspectable public var likedImage: UIImage? = UIImage(named: "likedAsset", in: Bundle(for: SweetLike.self), compatibleWith: nil) {
        didSet {
            likeButton.setImage(likedImage, for: UIControl.State.normal)
        }
    }
    @IBInspectable public var unlikedImage: UIImage? = UIImage(named: "unlikedAsset", in: Bundle(for: SweetLike.self), compatibleWith: nil) {
        didSet {
            unlikeButton.setImage(unlikedImage, for: UIControl.State.normal)
        }
    }
    @IBInspectable public var likedColor: UIColor? = UIColor(red: 201/255, green: 97/255, blue: 80/255, alpha: 1) {
        didSet {
            likeButton.imageView?.tintColor = likedColor
        }
    }
    @IBInspectable public var unlikedColor: UIColor? = UIColor(red: 201/255, green: 97/255, blue: 80/255, alpha: 1) {
        didSet {
            unlikeButton.imageView?.tintColor = unlikedColor
        }
    }
    
    // MARK: - Public Properties
    public var delegate: SweetLikeDelegate?
    public var likeAction: (() -> Void)?
    public var unlikeAction: (() -> Void)?
    public var likeActionAnimationDuration: Double = 0.6
    public var unlikeActionAnimationDuration: Double = 0.15
    public var currentStatus: SweetLikeStatus { return status }
    public var isAnimationEnabled: Bool = true
    
    // MARK: - Private Properties
    private var isAnimating = false
    private var status: SweetLikeStatus = SweetLikeStatus.unliked {
        didSet {
            switch status {
            case SweetLikeStatus.liked:
                isAnimationEnabled ? likeActionWithAnimation() : likeActionWithoutAnimation()
            case SweetLikeStatus.unliked:
                isAnimationEnabled ? unlikeActionWithAnimation() : unlikeActionWithoutAnimation()
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()

        initUI()
    }
}

// MARK: - Public Functions
public extension SweetLike {
    
    func setStatus(_ newStatus: SweetLikeStatus) {
        if isAnimating { return }
        
        status = newStatus
    }
}

// MARK: - Actions
private extension SweetLike {
    
    @objc func likeButtonAction() {
        setStatus(SweetLikeStatus.unliked)
    }
    
    @objc func unlikeButtonAction() {
        setStatus(SweetLikeStatus.liked)
    }
    
    @objc func likeActionWithAnimation() {
        isAnimating = true
        
        delegate?.likeAction()
        likeAction?()
        
        unlikeButton.alpha = 0
        likeButton.alpha = 1
        
        UIView.animateKeyframes(withDuration: likeActionAnimationDuration, delay: 0, options: [UIView.KeyframeAnimationOptions.beginFromCurrentState, UIView.KeyframeAnimationOptions(rawValue: 1)], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: self.likeActionAnimationDuration / 2, animations: {
                self.likeButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: self.likeActionAnimationDuration / 2, relativeDuration: self.likeActionAnimationDuration / 2, animations: {
                self.likeButton.transform = CGAffineTransform.identity
            })
        }, completion: { (_) in
            self.isAnimating = false
        })
    }
    
    @objc func likeActionWithoutAnimation() {
        isAnimating = true
        
        delegate?.likeAction()
        likeAction?()
        
        unlikeButton.alpha = 0
        likeButton.alpha = 1
        
        isAnimating = false
    }
    
    @objc func unlikeActionWithAnimation() {
        isAnimating = true
        
        delegate?.unlikeAction()
        unlikeAction?()
        
        UIView.animate(withDuration: unlikeActionAnimationDuration, animations: {
            self.likeButton.alpha = 0
            self.unlikeButton.alpha = 1
        }) { (_) in
            self.isAnimating = false
        }
    }
    
    @objc func unlikeActionWithoutAnimation() {
        isAnimating = true
        
        delegate?.unlikeAction()
        unlikeAction?()
        
        likeButton.alpha = 0
        unlikeButton.alpha = 1
        
        isAnimating = false
    }
}

// MARK: - Private Functions
private extension SweetLike {
    
    func initUI() {
        // Initializing like button
        likeButton = UIButton(frame: self.frame)
        likeButton.alpha = 0
        likeButton.setImage(likedImage, for: UIControl.State.normal)
        likeButton.imageView?.tintColor = likedColor
        likeButton.addTarget(self, action: #selector(likeButtonAction), for: UIControl.Event.touchUpInside)
        initButton(button: likeButton)
        
        // Initializing unlike button
        unlikeButton = UIButton(frame: self.frame)
        unlikeButton.alpha = 1
        unlikeButton.setImage(unlikedImage, for: UIControl.State.normal)
        unlikeButton.imageView?.tintColor = unlikedColor
        unlikeButton.addTarget(self, action: #selector(unlikeButtonAction), for: UIControl.Event.touchUpInside)
        initButton(button: unlikeButton)
    }
    
    func initButton(button: UIButton) {
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        addSubview(button)
        button.bindFrameToViewBounds(toView: self)
    }
}
