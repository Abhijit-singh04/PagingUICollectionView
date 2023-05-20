//
//  ViewController.swift
//  PagingUICollectionView
//
//  Created by Abhijit singh on 01/05/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView = UIImageView(frame: cell.frame)
        cell.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        //        imageView.image = UIImage(named: "woman-in-black-shirt-806715")
        
        return cell
        
    }
    
    
  let  cellwidth = (3/4)*UIScreen.main.bounds.width
   let spacing = (1/8)*UIScreen.main.bounds.width
    let cellSpacing = (1/16)*UIScreen.main.bounds.width



    
    lazy var collectionView: UICollectionView = {
        
        let layout = PagingCollectionViewLayout()
        layout.sectionInset = .init(top: 0, left: self.spacing, bottom: 0, right: self.spacing)
        layout.minimumLineSpacing = self.cellSpacing
        layout.itemSize = .init(width: self.cellwidth, height: self.cellwidth)
        layout.scrollDirection = .horizontal
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        
        return collectionView
        
    }()
    
    
    
            

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(collectionView)
        
        self.collectionView.leadingAnchor.constraint (equalTo: self.view.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint (equalTo: self.view.trailingAnchor).isActive = true
        self.collectionView.centerYAnchor.constraint (equalTo: self.view.centerYAnchor).isActive = true
        self.collectionView.heightAnchor.constraint (equalToConstant: cellwidth).isActive = true
    }


}



