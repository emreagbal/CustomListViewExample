//
//  CollectionViewController.swift
//  CustomListViewExample
//
//  Created by Emre Ağbal on 22.06.2020.
//  Copyright © 2020 Emre Ağbal. All rights reserved.
//

import UIKit


class CollectionViewController: UIViewController {

    var collectionViewModel : CollectionViewModel?
    
    var collectionViews = [CollectionViewModel.randomView](){
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.collectionViewModel = CollectionViewModel()
        self.collectionViews = self.collectionViewModel!.views
    }
    
    // MARK: - UI Component Design
    fileprivate let yenileButton : UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 619, width: 390, height: 50)
        button.setTitle("YENİLE", for: .normal)
        button.tintColor = .blue
        button.backgroundColor = .opaqueSeparator
        button.addTarget(nil, action:#selector(buttonAction), for: .allEvents)
        
    
        return button
    }()
    
    
    @objc func buttonAction (){
        let refreshedViews = CollectionViewModel()
        self.collectionViews = refreshedViews.views
        collectionView.reloadData()
    }
    
    fileprivate let collectionView : UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.estimatedItemSize = CGSize(width: 50, height: 90)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.collectionViewLayout = layout
        
        cv.register(CollectionViewCellModel.self, forCellWithReuseIdentifier: "cell")
        return cv
        
    }()
    
    // MARK: - View Did Load Operations
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(collectionView)
        view.addSubview(yenileButton)
        
       
        collectionView.backgroundColor = .lightGray
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }


}

    // MARK: - Collection View Data Source and Layout
extension CollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionViews[indexPath.row].height
        return CGSize(width: (collectionView.frame.width - 20)/2, height: height)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailView = mainStoryBoard.instantiateViewController(withIdentifier: "detailView") as? DetailViewController else {
            print("Couldn't find the view")
            return
        }
        
        detailView.collectionViewControllerDelegate = self
        detailView.cellView = collectionViews[indexPath.row]
        
        present(detailView, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCellModel
        
        let item = collectionViews[indexPath.row]
        cell.height = item.height
        cell.backgroundColor = item.color
        
        return cell
    }
    
}
