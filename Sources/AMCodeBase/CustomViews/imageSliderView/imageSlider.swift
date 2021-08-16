//
//  imageSlider.swift
//  sharex
//
//  Created by Amr Moussa on 02/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit


open class AMImageSlider:UIView{
    let layout = UICollectionViewFlowLayout()
    var collectioView : UICollectionView!
    let pager = UIPageControl()
    var imgArr:[String] = []
    
    var timer = Timer()
    var counter = 0
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(imgUrls:[String]) {
        super.init(frame: .zero)
        self.imgArr = imgUrls
        configureImageView()
        configurePager()
        
    }
    
    public init(imgUrls:[String],withAutomaticslider automatic:Bool ,interval:Double) {
        super.init(frame: .zero)
        self.imgArr = imgUrls
        configureImageView()
        configurePager()
        configureAutomaticSliding(automatic: automatic, interval: interval)
        
    }
    
    
    private func configureImageView(){
        
        
        layout.scrollDirection = .horizontal
        collectioView = UICollectionView(frame:self.bounds , collectionViewLayout: layout)
        collectioView.delegate = self
        collectioView.dataSource = self
        collectioView.collectionViewLayout = layout
        collectioView.showsHorizontalScrollIndicator = false
        collectioView.isPagingEnabled = true
        collectioView.register(AMImageSliderCell.self, forCellWithReuseIdentifier: AMImageSliderCell.cellID)
        
        
        addSubview(collectioView)
        
        collectioView.pinToSuperViewEdges(in: self)
        translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func configurePager(){
        
        addSubview(pager)
        pager.pageIndicatorTintColor = .systemGray5
        pager.currentPageIndicatorTintColor = .orange
        pager.numberOfPages = imgArr.count
        pager.currentPage = 0
        
        pager.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pager.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pager.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pager.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            pager.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureAutomaticSliding(automatic:Bool ,interval:Double){
        if automatic && !timer.isValid   {
            DispatchQueue.main.async {
                self.timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            }
            
        }
        
        
    }
    @objc func changeImage(){
        if counter < imgArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.collectioView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pager.currentPage = counter
            counter += 1
            
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.collectioView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pager.currentPage = counter
            counter = 1
        }
        
        
        
    }
    
    
    open func setImages(imgArr:[String],Animated:Bool = false,interval:Double = 0.0){
        self.imgArr = imgArr
        collectioView.reloadData()
        configurePager()
        configureAutomaticSliding(automatic: Animated, interval: interval)
        
    }
    
    
    
}

extension AMImageSlider:UICollectionViewDelegate,
                      UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return  imgArr.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AMImageSliderCell.cellID, for: indexPath) as! AMImageSliderCell
        cell.setImage(img: imgArr[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        counter = Int(roundedIndex)
        pager.currentPage = Int(roundedIndex)
    }
    
    
}
