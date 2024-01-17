//
//  BookViewController.swift
//  Study240116
//
//  Created by SangRae Kim on 1/17/24.
//

import UIKit

class BookViewController: UIViewController {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var collectionView: UICollectionView!
    
    var list: [Document] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Search Book"
        configureSearchBar()
        configureCollectionView()
    }
}

extension BookViewController: UISearchBarDelegate {
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "책 제목을 입력하세요."
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        BookManager().callRequest(text: searchBar.text!) { books in
            self.list = books
        }
    }
}

extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let xib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "BookCollectionViewCell")
        
        setLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        
        cell.configureCell(list[indexPath.item])
        
        return cell
    }
    
    func setLayout() {
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 8
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (space * 3)
        
        layout.itemSize = CGSize(width: cellWidth/2, height: cellWidth/2*1.5)
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        
        collectionView.collectionViewLayout = layout
    }
}
