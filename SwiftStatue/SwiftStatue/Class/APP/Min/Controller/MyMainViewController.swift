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
    var collectionReusableView :MainHeadReusableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
                
        let flowLayout = UICollectionViewFlowLayout.init()
        let tempWid = floorf(Float((kWidth - 40)/3))
        flowLayout.itemSize = CGSize(width: CGFloat(tempWid), height: CGFloat(tempWid))
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets.init(top: 10, left: 5, bottom: 10, right: 5)
        flowLayout.headerReferenceSize = CGSize(width: kWidth, height: 80)
        
        collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width:kWidth , height: kHeight - CGFloat(kTabHig)), collectionViewLayout: flowLayout)
        collectionView?.delegate = self as UICollectionViewDelegate
        collectionView?.dataSource = self as UICollectionViewDataSource
        collectionView?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "classCell")
        collectionView?.register(MainHeadReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headView")
        collectionView?.backgroundColor = UIColor.white
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        view.addSubview(collectionView!)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let  cell  = collectionView.dequeueReusableCell(withReuseIdentifier:"classCell" , for: indexPath)
    
        cell.backgroundColor  = randomColorAlpha()
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
   
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
         if kind == UICollectionView.elementKindSectionHeader   {
            
            collectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headView", for: indexPath) as? MainHeadReusableView
           
            collectionReusableView?.titleLab?.text = "这是标题"
            
//            return collectionReusableView!
         }
        return UIView.init() as! UICollectionReusableView
    }
    
   
//    viewForSupplem
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {

    }

//    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
//
//    }
    
    
//    //返回HeadView的宽高
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHe
//        aderInSection, section: Int) -> CGSize{
//
//        return CGSize(width: kWidth, height: 80)
//
//    }


}
