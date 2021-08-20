//
//  File.swift
//  
//
//  Created by Amr Moussa on 18/08/2021.
//

import UIKit
public typealias AMCollectionViewCell = UICollectionViewCell & AMCelldelegate
open class AMCollectionViewController<cellType:AMCollectionViewCell,Item:Codable>: UIViewController,
        UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    
    open  var cellSize:CGSize!
    open var items:[Item] = []

    open var AMCollectionView:UICollectionView!
    open var  layout = UICollectionViewFlowLayout()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureView()
        chanegCellSize()
    }
    
    
    open func configureView(){
        // override this mehtod to  change collectionView configuration and don't forget to add super.configureView()
        AMCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        AMCollectionView.register(cellType.self, forCellWithReuseIdentifier:cellType.cellID)
        AMCollectionView.delegate = self
        AMCollectionView.dataSource = self
        AMCollectionView.translatesAutoresizingMaskIntoConstraints = false
        AMCollectionView.backgroundColor = .systemBackground
    }

    open func chanegCellSize(){
        // override this mehtod and change cellSize
        self.cellSize = .init(width: AMCollectionView.frame.width, height: 100)
    }
    open func UpadateItem(items:[Item]){
        self.items = items
        self.AMCollectionView.reloadData()
        
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
    
    
    
}


public protocol AMCelldelegate {
     static var cellID: String {get set }
    func updateItem(item:Codable)
}










