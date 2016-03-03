//
//  DiscoverVC.swift
//  WoXingWoXiu
//
//  Created by 刘剑文 on 16/2/24.
//  Copyright © 2016年 kevinil. All rights reserved.
//

import UIKit

class DiscoverVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var wholeSV: UIScrollView!
    @IBOutlet weak var wholeView: UIView!
//    @IBOutlet weak var topSV: UIScrollView!
//    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var cardCV: UICollectionView!

    @IBAction func selectPage(sender: AnyObject) {
        topSV.contentOffset = CGPointMake(topSV.bounds.width * CGFloat(pageControl.currentPage), 0)
    }
    
    @IBOutlet weak var rankingsIV: UIImageView!
    @IBOutlet weak var storeIV: UIImageView!
    @IBOutlet weak var guessIV: UIImageView!
    @IBOutlet weak var goldIV: UIImageView!
    
    var topSV : UIScrollView!
    var pageControl : UIPageControl!
    var topPageView : UIImageView!
    var swipeGesture : UISwipeGestureRecognizer!
    var rankingsTap : UITapGestureRecognizer!
    var storeTap : UITapGestureRecognizer!
    var guessTap : UITapGestureRecognizer!
    var goldTap : UITapGestureRecognizer!
    
    var rectSize : CGFloat!
    
    var images = ["mineCover","bg","back"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSize()
        setColorNavBar(self)
        setupTopSVImage()
        setupIVSegue()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.hidden = false
    }
    
    func setupSize() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 0
        rectSize = view.bounds.width / 2 - 12
        layout.itemSize = CGSizeMake(rectSize, rectSize)
        cardCV!.collectionViewLayout = layout
    }
    
    func setupTopSVImage() {
        let viewWidth = view.bounds.width + 8
        let viewHeight = view.bounds.height
        topSV = UIScrollView(frame: CGRectMake(0, 0, viewWidth, viewHeight / 3))
        topSV.contentSize = CGSizeMake(viewWidth * 3, viewHeight / 3)
        topSV.pagingEnabled = true
        topSV.delegate = self
        for index in 0..<3 {
            let iv = UIImageView(image: UIImage(named: "mineCover"))
            iv.frame = CGRectMake(CGFloat(index) * viewWidth, 0, viewWidth, viewHeight / 3)
            topSV.addSubview(iv)
        }
        topSV.showsHorizontalScrollIndicator = false
        topSV.bounces = false
        wholeView.addSubview(topSV)
        swipeGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipe")
        swipeGesture.delegate = self
        
        pageControl = UIPageControl(frame: CGRectMake(viewWidth / 2 - 30, viewHeight / 3 - 60, 60, 40))
        pageControl.numberOfPages = 3
        wholeView.addSubview(pageControl)
        
//        topPageView = UIImageView(image: UIImage(named: "back"))
//        topPageView.frame = CGRectMake(viewWidth / 2 - 30, viewHeight / 3 - 60, 60, 40)
//        wholeView.addSubview(topPageView)
    }
    
    func handleSwipe() {
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        switch scrollView.contentOffset.x {
        case 0 : topPageView = UIImageView(image: UIImage(named: "back"))
        case view.bounds.width + 8 : topPageView = UIImageView(image: UIImage(named: "back"))
        default : topPageView = UIImageView(image: UIImage(named: "back"))
        }
    }
    
    func setupIVSegue() {
        rankingsTap = UITapGestureRecognizer(target: self, action: "goRankings")
        rankingsIV.addGestureRecognizer(rankingsTap)
        storeTap = UITapGestureRecognizer(target: self, action: "goStore")
        storeIV.addGestureRecognizer(storeTap)
        guessTap = UITapGestureRecognizer(target: self, action: "goGuess")
        guessIV.addGestureRecognizer(guessTap)
        goldTap = UITapGestureRecognizer(target: self, action: "goGold")
        goldIV.addGestureRecognizer(goldTap)
    }
    
    
    
    func goRankings() {
        performSegueWithIdentifier("discoverRankings", sender: nil)
    }
    
    func goStore() {
        performSegueWithIdentifier("discoverStore", sender: nil)
    }
    
    func goGuess() {
        performSegueWithIdentifier("discoverGuess", sender: nil)
    }
    
    func goGold() {
        performSegueWithIdentifier("discoverGold", sender: nil)
    }
    
    // MARK: Collection View Delegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
//        switch Sections(rawValue: section)! {
//        case .Branch : return 1
//        case .Recommend : return 2
//        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        switch Sections(rawValue: indexPath.section)! {
//        case .Branch :
//            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("branchCell", forIndexPath: indexPath)
//            return cell
//        case .Recommend :
//            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("recommendCell", forIndexPath: indexPath)
//            return cell
//        }
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("recommendCell", forIndexPath: indexPath)
        return cell
    }
    
    private enum Sections : Int {
        case Branch, Recommend
    }
    
}
