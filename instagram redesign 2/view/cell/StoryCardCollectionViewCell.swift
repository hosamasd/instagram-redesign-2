//
//  StoryCardCollectionViewCell.swift
//  instagram redesign 2
//
//  Created by Hossam on 9/6/20.
//  Copyright © 2020 Hossam. All rights reserved.
//


import UIKit

struct Stories {
    let image:String
    let username:String
}

class StoryCardCollectionViewCell: UICollectionViewCell {
    
    var story = [
        Stories(image: "img1", username: "Add Story"),
        Stories(image: "img2", username: "jack"),
        Stories(image: "img3", username: "carolina"),
        Stories(image: "img4", username: "samuel"),
        Stories(image: "img5", username: "ariana josep"),
        Stories(image: "img6", username: "puggy_101"),
        Stories(image: "img7", username: "dheeraj_ks")
    ]
    
    lazy var cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints=false
        v.backgroundColor = .white
        v.setCardShadow()
        v.layer.cornerRadius = 15
        v.isUserInteractionEnabled=true
        return v
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.showsVerticalScrollIndicator = false
        cv.setCollectionViewLayout(layout, animated: false)
        cv.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        cv.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cardView)
         cardView.addSubview(collectionView)
        collectionView.fillSuperview()
        NSLayoutConstraint.activate([
                   cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                   cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                   cardView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
                   cardView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15)
               ])
//        cardView.fillSuperview(padding: .init(top: 15, left: 15, bottom: -15, right: 10))
       
        
//        cardView.hstack(collectionView)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension StoryCardCollectionViewCell:UICollectionViewDelegateFlowLayout , UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return story.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        cell.loaderView.isHidden = indexPath.row == 0 ? false : true
        cell.profileImage.image = UIImage(named:story[indexPath.row].image)
        cell.username.text = story[indexPath.row].username
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
