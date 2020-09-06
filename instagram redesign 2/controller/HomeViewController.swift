//
//  HomeViewController.swift
//  Instagram refined Desgin
//
//  Created by hosam on 9/3/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit


struct CustomColors {
    static let appBackground:UIColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
}


class HomeViewController: UIViewController {
     lazy var collectionView:UICollectionView = {
            let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
            cv.translatesAutoresizingMaskIntoConstraints = false
            cv.showsHorizontalScrollIndicator = false
            cv.setCollectionViewLayout(layout, animated: false)
            cv.register(PostCardCollectionViewCell.self, forCellWithReuseIdentifier: "PostCardCollectionViewCell")
            cv.register(StoryCardCollectionViewCell.self, forCellWithReuseIdentifier: "StoryCardCollectionViewCell")
            cv.delegate = self
            cv.dataSource = self
            cv.backgroundColor = .clear
            return cv
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = CustomColors.appBackground
            view.stack(collectionView)
        }
    }

    extension HomeViewController:UICollectionViewDelegate , UICollectionViewDelegateFlowLayout , UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 2
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if indexPath.row == 0{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCardCollectionViewCell", for: indexPath) as! StoryCardCollectionViewCell
                return cell
            }
            if indexPath.row == 1{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCardCollectionViewCell", for: indexPath) as! PostCardCollectionViewCell
                return cell
            }
            return UICollectionViewCell()
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if indexPath.row == 1 {
                return CGSize(width: view.frame.width-120 , height:collectionView.frame.height)
            } else {
                return CGSize(width: 120 , height:collectionView.frame.height)
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    }
