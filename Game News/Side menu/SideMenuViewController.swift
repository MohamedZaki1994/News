//
//  SideMenuViewController.swift
//  Game News
//
//  Created by Mohamed Mahmoud Zaki on 8/2/19.
//  Copyright © 2019 Zaki. All rights reserved.
//

import UIKit

protocol SideMenuActionProtocol {
   func close()
}
class SideMenuViewController: UIViewController {
    var delegate: SideMenuActionProtocol?

    @IBAction func closeButton(_ sender: Any) {
        delegate?.close()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension SideMenuViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        guard let sideMenuCell = cell as? SideMenuCollectionViewCell else {
            return cell
        }
        sideMenuCell.image.backgroundColor = .red
        return sideMenuCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.close()
    }
}

extension SideMenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
