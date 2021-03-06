//
//  ShowCardsViewController.swift
//  PPP Crypto Algorithm
//
//  Created by Ricardo Hernández González on 07/02/20.
//  Copyright © 2020 unam. All rights reserved.
//

import UIKit

class ShowCardsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: String(describing: CardCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        CardsManager.shared.resetCards()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ShowCardsViewController: UICollectionViewDelegate{
    
}

extension ShowCardsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CardsManager.shared.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as! CardCollectionViewCell
        cell.layer.borderWidth = 1.0
        var counter = 0
        for i in 0..<4{
            for j in 0..<4{
                let stack = cell.stackView.arrangedSubviews[i+1] as! UIStackView
                let label = stack.arrangedSubviews[j+1] as! UILabel
                label.text = CardsManager.shared.cards[indexPath.row][(i+j)+(i*3)]
                counter += 1
//                label.text = " hola ssjj "
            }
        }
        return cell
    }
}

extension ShowCardsViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 850)
    }
}
