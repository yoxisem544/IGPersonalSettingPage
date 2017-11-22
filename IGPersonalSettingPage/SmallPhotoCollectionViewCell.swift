//
//  SmallPhotoCollectionViewCell.swift
//  IGPersonalSettingPage
//
//  Created by David on 2017/9/27.
//  Copyright © 2017年 David. All rights reserved.
//

import UIKit

final public class SmallPhotoCollectionViewCell: UICollectionViewCell {
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    
    backgroundColor = UIColor.randomColor()
  }
  
}
