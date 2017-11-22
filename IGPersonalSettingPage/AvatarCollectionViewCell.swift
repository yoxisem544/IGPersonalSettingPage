//
//  AvatarCollectionViewCell.swift
//  IGPersonalSettingPage
//
//  Created by David on 2017/9/27.
//  Copyright © 2017年 David. All rights reserved.
//

import UIKit

final public class AvatarCollectionViewCell: UICollectionViewCell {
  
  public class var preferredSize: CGSize {
    return CGSize(width: UIScreen.main.bounds.width, height: 140)
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    
    backgroundColor = .green
  }
  
}
