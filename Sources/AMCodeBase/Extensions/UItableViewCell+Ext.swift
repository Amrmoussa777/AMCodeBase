//
//  UItableViewCell+Ext.swift
//  sharex
//
//  Created by Amr Moussa on 26/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//

import UIKit

public extension UICollectionViewCell {
    var collectionView: UICollectionView? {
        return self.next(of: UICollectionView.self)
    }

    var indexPath: IndexPath? {
        return self.collectionView?.indexPath(for: self)
    }
}



public extension UIResponder {
    func next<U: UIResponder>(of type: U.Type = U.self) -> U? {
        return self.next.flatMap({ $0 as? U ?? $0.next() })
    }
}
