//
//  StoryCollectionViewCell.swift
//  instagram redesign 2
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    lazy var profileImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 35
        img.constrainWidth(constant: 70)
        img.constrainHeight(constant: 70)
        return img
    }()

    lazy var loaderView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 35
        v.constrainWidth(constant: 70)
               v.constrainHeight(constant: 70)
        return v
    }()
    
    lazy var addBtn:UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 12.5
        btn.constrainWidth(constant: 25)
               btn.constrainHeight(constant: 25)
        return btn
    }()
    
    lazy var username:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubViews(views: profileImage,username,loaderView)
        
        loaderView.addSubview(addBtn)
        
        profileImage.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 15, left: 0, bottom: 0, right: 0))
        loaderView.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil,padding: .init(top: 15, left: 0, bottom: 0, right: 0))
        addBtn.anchor(top: nil, leading: nil, bottom: loaderView.bottomAnchor, trailing: loaderView.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        username.anchor(top: profileImage.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 10, left: 10, bottom: 0, right: 10))

        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            username.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
