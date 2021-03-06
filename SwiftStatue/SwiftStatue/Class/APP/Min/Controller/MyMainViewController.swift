//
//  MyMainViewController.swift
//  SwiftStatue
//
//  Created by 凌志 on 2020/7/14.
//  Copyright © 2020 凌志. All rights reserved.
//

import UIKit

class MyMainViewController: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource {

    var collectionView : UICollectionView?
    
    let itemCtionViewCell = "ItemCtionViewCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
                
        let flowLayout = UICollectionViewFlowLayout.init()
        let tempWid = floorf(Float((kWidth - 30)/5))
        flowLayout.itemSize = CGSize(width: CGFloat(tempWid), height: CGFloat(80))
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.sectionInset = UIEdgeInsets.init(top: 10, left: 5, bottom: 10, right: 5)
        flowLayout.headerReferenceSize = CGSize(width: kWidth, height: 80)
        
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width:kWidth , height: kHeight - CGFloat(kTabHig)), collectionViewLayout: flowLayout)
        collectionView?.delegate = self as UICollectionViewDelegate
        collectionView?.dataSource = self as UICollectionViewDataSource
        
        collectionView?.register(UINib.init(nibName: itemCtionViewCell, bundle: nil), forCellWithReuseIdentifier: itemCtionViewCell)
        
//       collectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "classCell")
        
        collectionView?.register(MainHeadReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headView")
        collectionView?.backgroundColor = UIColor.white
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView!)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let  cell:ItemCtionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier:itemCtionViewCell, for: indexPath) as! ItemCtionViewCell
    
        
        cell.backgroundColor  = randomColorAlpha()
        
        cell.itemName.text =  NSString.init(format:"%d分区_%d", indexPath.section ,indexPath.row) as String
        
        cell.itemImage.image = UIImage.init(named:"place_yonghu")
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(indexPath.row)
    }
   
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
         
        
         if kind == UICollectionView.elementKindSectionHeader   {
            
            let headview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headView", for: indexPath)
           
            for view in headview.subviews {
                view.removeFromSuperview()
            }

            let liview = MainHeadReusableView.init(frame: CGRect(x: 0, y: 0, width: kWidth, height: 80));
            
            liview.titleLab?.text = "这是标题"
            
            headview.addSubview(liview)
            
            return headview
            
         }
          return UICollectionReusableView()
    }
    
  /*
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

           return CGSize (width: kWidth, height: 100)
       }

 
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

            return 10
    }
  
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

            return 10

    }

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

          return  UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)

      }
   */

}
