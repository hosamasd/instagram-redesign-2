//
//  PostCollectionViewCell.swift
//  instagram redesign 2
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    lazy var cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.setCardShadow()
        v.layer.cornerRadius = 15
        return v
    }()
    
    lazy var  profileImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "demo")
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        img.constrainWidth(constant: 30)
        img.constrainHeight(constant: 30)
        return img
    }()
    
    lazy var  username:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "dheeraj_ks"
        l.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return l
    }()
    
    lazy var likeImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "red-heart")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(likeImageTapped))
        tap.numberOfTapsRequired = 1
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        img.constrainWidth(constant: 25)
//        img.constrainHeight(constant: 25)
        return img
    }()
    
    lazy var postImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        return img
    }()
    
    lazy var  heartImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "white-heart")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.isHide(true)
        img.constrainWidth(constant: 70)
        img.constrainHeight(constant: 70)
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let ss = hstack(profileImage,username,likeImage,spacing:16)
        
        stack(ss,postImage,spacing:16).withMargins(.init(top: 8, left: 8, bottom: 8, right: 8))
        addSubview(heartImage)
        heartImage.centerInSuperview()
        likeImage.alpha = 0
    }
    
    @objc func doubleTapped(){
        self.heartImage.isHide(false)
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.heartImage.transform = .init(scaleX: 1.8, y: 1.8)
            self.postImage.transform = .init(scaleX: 1.05, y: 1.05)
            self.likeImage.center.y += 50
        } ,completion:{ finished in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.postImage.transform = .identity
                self.likeImage.center.y -= 50
                self.likeImage.alpha = 1
            })
            self.heartImage.transform = .identity
            self.heartImage.isHide(true)
        })
    }
    
    @objc func likeImageTapped(){
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.likeImage.center.y += 50
            self.likeImage.alpha = 0
        } ,completion:{ finished in
            self.likeImage.center.y -= 50
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
