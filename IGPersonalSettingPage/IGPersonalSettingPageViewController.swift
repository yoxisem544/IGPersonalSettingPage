//
//  ViewController.swift
//  IGPersonalSettingPage
//
//  Created by David on 2017/9/27.
//  Copyright © 2017年 David. All rights reserved.
//

import UIKit

final public class IGPersonalSettingPageViewController: UIViewController {
  
  public enum DatumDisplayType {
    case smallPhoto
    case fullPhoto
  }
  
  private var rootCollectionView: UICollectionView!
  private var rootCollectionViewFlowLayout: UICollectionViewFlowLayout!
  private var currentDatumDisplayType: DatumDisplayType = .smallPhoto
  
  public var sectionCount: Int {
    return 3
  }
  public var tabSize: CGSize {
    return CGSize(width: view.bounds.width, height: 44)
  }
  public var fullPhotoCellSize: CGSize {
    let length = view.bounds.width
    return CGSize(width: length, height: length)
  }
  public var seperatorLineWidth: CGFloat {
    return 2.0
  }
  public var smallPhotoCellSize: CGSize {
    let perRowCount = 3
    let seperatorTotalWidth = (seperatorLineWidth * (perRowCount - 1).cgFloat)
    let length = (view.bounds.width - seperatorTotalWidth) / perRowCount.cgFloat
    return CGSize(width: length, height: length)
  }
  

  override public func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    configureUI()
    view.backgroundColor = .white
    
  }
  
  private func configureUI() {
    configureRootCollectionView()
  }
  
  private func configureRootCollectionView() {
    rootCollectionViewFlowLayout = UICollectionViewFlowLayout()
    rootCollectionViewFlowLayout.itemSize = CGSize(width: view.bounds.width, height: 100)
    rootCollectionViewFlowLayout.minimumLineSpacing = seperatorLineWidth
    rootCollectionViewFlowLayout.minimumInteritemSpacing = seperatorLineWidth
    
    rootCollectionView = UICollectionView(frame: view.bounds,
                                          collectionViewLayout: rootCollectionViewFlowLayout)
    rootCollectionView.backgroundColor = .clear
    
    rootCollectionView.register(cellTypes: [AvatarCollectionViewCell.self,
                                            TabCollectionViewCell.self,
                                            SmallPhotoCollectionViewCell.self])
    rootCollectionView.delegate = self
    rootCollectionView.dataSource = self
    rootCollectionView.anchor(to: view)
  }
  
  public enum IGPersonalSettingSection: Int {
    case avatar = 0
    case tab = 1
    case datum = 2
  }

}

extension IGPersonalSettingPageViewController : UICollectionViewDelegateFlowLayout {
  
  public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    switch indexPath.section {
    case IGPersonalSettingSection.avatar.rawValue:
      return AvatarCollectionViewCell.preferredSize
    case IGPersonalSettingSection.tab.rawValue:
      return tabSize
    case IGPersonalSettingSection.datum.rawValue:
      switch currentDatumDisplayType {
      case .smallPhoto: return smallPhotoCellSize
      case .fullPhoto: return fullPhotoCellSize
      }
    default: fatalError()
    }
    
  }
  
}

extension IGPersonalSettingPageViewController : UICollectionViewDataSource {
  
  public func numberOfSections(in collectionView: UICollectionView) -> Int {
    return sectionCount
  }
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
    case IGPersonalSettingSection.avatar.rawValue:
      return 1
    case IGPersonalSettingSection.tab.rawValue:
      return 1
    case IGPersonalSettingSection.datum.rawValue:
      return 1000
    default: fatalError()
    }
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch indexPath.section {
    case IGPersonalSettingSection.avatar.rawValue:
      let cell = collectionView.dequeueReusableCell(with: AvatarCollectionViewCell.self, for: indexPath)
      return cell
    case IGPersonalSettingSection.tab.rawValue:
      let cell = collectionView.dequeueReusableCell(with: TabCollectionViewCell.self, for: indexPath)
      cell.delegate = self
      return cell
    case IGPersonalSettingSection.datum.rawValue:
      let cell = collectionView.dequeueReusableCell(with: SmallPhotoCollectionViewCell.self, for: indexPath)
      return cell
    default: fatalError()
    }
  }
  
}

extension IGPersonalSettingPageViewController : TabCollectionViewCellDelegate {
  
  public func tabCollectionViewCell(didChangeTo type: IGPersonalSettingPageViewController.DatumDisplayType) {
    print("reload here, not yet implemented.")
  }
  
}
