//
//  CustomKeyboard.swift
//  CustomKeyoard
//
//  Created by SSAM on 2022/08/24.
//

import UIKit

class CustomKeyboard: UIView {

    @IBOutlet var viewMain: UIView!
    @IBOutlet weak var categoryCV: UICollectionView!
    @IBOutlet weak var emoticonCV: UICollectionView!


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.ckInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.ckInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ckInit()
        
    }
    
   private func ckInit() {
       
        Bundle.main.loadNibNamed("CustomKeyboard", owner: self, options: nil)
        self.addSubview(viewMain)
        self.viewMain.frame = self.bounds
        self.viewMain.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.regiNib()
    }
    
    private func regiNib() {
        let categoryCell = UINib(nibName: "EmoticonCategoryCell", bundle: nil)
        self.categoryCV.register(categoryCell, forCellWithReuseIdentifier: "cateCell")
        self.categoryCV.delegate = self
        self.categoryCV.dataSource = self
        
        let emoticonCell = UINib(nibName: "EmoticonCell", bundle: nil)
        self.emoticonCV.register(emoticonCell, forCellWithReuseIdentifier: "EmoticonCell")
        self.emoticonCV.delegate = self
        self.emoticonCV.dataSource = self
    }

}

extension CustomKeyboard : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCV {
            return 10
        } else if collectionView == emoticonCV {
            return 20
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cateCell", for: indexPath) as! EmoticonCategoryCell
            cell.emoticonImg.image = UIImage(named: "B003958408.jpeg")
            
            return cell
        } else if collectionView == emoticonCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmoticonCell", for: indexPath) as! EmoticonCell
            cell.emoticonImg.image = UIImage(named: "ryan.jpeg")
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
