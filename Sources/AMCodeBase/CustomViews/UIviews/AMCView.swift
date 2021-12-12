//
//  File.swift
//  
//
//  Created by Amr Moussa on 12/12/2021.
//


import UIKit


open class AMCView<cellType:AMCollectionViewCell,Item:Codable>: UIView,
                UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    
    open  var cellSize:CGSize!
    open var items:[Item] = []
    
    open var AMCollectionView:UICollectionView!
    open var layout = UICollectionViewFlowLayout()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        chanegCellSize()
    }
    
    required public  init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configureView(){
        // override this mehtod to  change collectionView configuration and don't forget to add super.configureView()
        AMCollectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        AMCollectionView.register(cellType.self, forCellWithReuseIdentifier:cellType.cellID)
        AMCollectionView.delegate = self
        AMCollectionView.dataSource = self
        AMCollectionView.translatesAutoresizingMaskIntoConstraints = false
        AMCollectionView.backgroundColor = .systemBackground
        addSubViews(AMCollectionView)
        AMCollectionView.pinToSuperViewSafeArea(in: self)
    }
    
    open func chanegCellSize(){
        // override this mehtod and change cellSize
        self.cellSize = .init(width: AMCollectionView.frame.width, height: 100)
    }
    
    open func UpadateItem(items:[Item]){
        self.items = items
        self.AMCollectionView.reloadData()
        
    }
    
   
    open override func layoutSubviews() {
        // change cell size as layout of collection view will change so we need to recalcualte cellsize as it depends on
        //  colection view frame which has changed .
        super.layoutSubviews()
        chanegCellSize()
    }
    
    
    
      open  func registerNewCell(newCell:AMCollectionViewCell.Type){
          AMCollectionView.register(newCell.self, forCellWithReuseIdentifier:newCell.cellID)
      }
      
      open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          items.count
      }
      
      open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = AMCollectionView.dequeueReusableCell(withReuseIdentifier: cellType.cellID, for: indexPath) as! cellType
          cell.updateItem(item: items[indexPath.row])
          return cell
      }
      
      open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
      
      open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 0
      }
      
      open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 0
      }
      
      open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
          return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
      }
      
      
      
      open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: cellSize.width, height: cellSize.height)
      }
      
      open func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {}
   
    
}

