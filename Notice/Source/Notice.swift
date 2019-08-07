//
//  Notice.swift
//  Notice
//
//  Created by Tian Tong on 2019/8/7.
//  Copyright © 2019 TTDP. All rights reserved.
//

import UIKit

public class Notice: UIView {
    
    let title: String
    let type: NoticeType
    
    public init(title: String, type: NoticeType) {
        self.title = title
        self.type = type
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        setupViews()
    }
    
    // MARK: - View
    
    let contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
        view.alpha = 0.9
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .equalCentering
        view.spacing = 10
        return view
    }()
    
    let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    func setupViews() {
        let width = UIScreen.main.bounds.width
        
        addSubview(contentView)
        contentView.backgroundColor = type.color
        addConstraints(format: "H:|-10-[v0(\(width - 20))]-10-|", views: contentView)
        addConstraints(format: "V:|-(-44)-[v0(44)]|", views: contentView)
        
        addSubview(stackView)
        addConstraints(format: "V:|-(-44)-[v0(44)]|", views: stackView)
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20).isActive = true
        
        iconView.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh + 1, for: .horizontal)
        iconView.image = type.icon
        stackView.addArrangedSubview(iconView)
        
        titleLabel.text = title
        stackView.addArrangedSubview(titleLabel)
    }
    
    public func show() {
        let window = UIApplication.shared.keyWindow!
        window.addSubview(self)
        
        let y: CGFloat = UIView.hasTopNotch ? 88 : 64
        UIView.animate(withDuration: NoticeConfig.appearDuration, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: y)
        }) { _ in
            UIView.animate(withDuration: NoticeConfig.disappearDuration, delay: NoticeConfig.showTime, animations: {
                self.transform = CGAffineTransform(translationX: 0, y: -y)
            }) { _ in
                self.removeFromSuperview()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
