//
//  CustomCollectionViewCellModel.swift
//  CustomListViewExample
//
//  Created by Emre Ağbal on 22.06.2020.
//  Copyright © 2020 Emre Ağbal. All rights reserved.
//

import UIKit

class CollectionViewCellModel : UICollectionViewCell {
    
    var height : CGFloat?
    
    convenience required init(coder: NSCoder?, height: CGFloat? ) {
        self.init()
        self.height = height
        
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
                
        var frame = layoutAttributes.frame
        frame.size.height = height!
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
   
}
