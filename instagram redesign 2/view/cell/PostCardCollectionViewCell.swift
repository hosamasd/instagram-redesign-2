//
//  PostCardCollectionViewCell.swift
//  instagram redesign 2
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//


import UIKit

struct Posts {
    let profileImage:String
    let username:String
    let postImage:String
}

class PostCardCollectionViewCell: UICollectionViewCell {
    
    var post:[Posts] = [
        Posts(profileImage: "img2", username: "jack", postImage: "post1"),
        Posts(profileImage: "img4", username: "samuel", postImage: "post2"),
        Posts(profileImage: "img3", username: "carolina", postImage: "post3"),
        Posts(profileImage: "img6", username: "puggy_101", postImage: "post4"),
    ]
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.setCollectionViewLayout(layout, animated: false)
        cv.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: "PostCollectionViewCell")
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stack(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PostCardCollectionViewCell:UICollectionViewDelegateFlowLayout, UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as! PostCollectionViewCell
        cell.profileImage.image = UIImage(named: post[indexPath.row].profileImage)
        cell.username.text = post[indexPath.row].username
        cell.postImage.image = UIImage(named: post[indexPath.row].postImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
