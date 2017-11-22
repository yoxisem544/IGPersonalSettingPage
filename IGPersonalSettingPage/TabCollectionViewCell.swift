//
//  TabCollectionViewCell.swift
//  IGPersonalSettingPage
//
//  Created by David on 2017/9/27.
//  Copyright © 2017年 David. All rights reserved.
//

import UIKit

public protocol TabCollectionViewCellDelegate: class {
  func tabCollectionViewCell(didChangeTo type: IGPersonalSettingPageViewController.DatumDisplayType)
}

final public class TabCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet public weak var smallImageButton: UIButton!
  @IBOutlet public weak var fullImageButton: UIButton!
  
  public weak var delegate: TabCollectionViewCellDelegate?
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    
    backgroundColor = UIColor(hexString: "#e8e8e8")
    
    smallImageButton.setTitle("小", for: .normal)
    fullImageButton.setTitle("大", for: .normal)
  }
  
  @IBAction public func smallButtonClicked(button: UIButton) {
    delegate?.tabCollectionViewCell(didChangeTo: .smallPhoto)
  }
  
  @IBAction public func fullButtonClicked(button: UIButton) {
    delegate?.tabCollectionViewCell(didChangeTo: .fullPhoto)
  }
  
}
