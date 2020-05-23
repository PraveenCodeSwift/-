//
//  BookListViewController.swift
//  kannada
//
//  Created by PraveenH on 02/05/20.
//  Copyright © 2020 books. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    var authors : Authors?
    var authorlist : [Authors] = []
    var bookslist : [Books] = []
    var navtitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = navtitle
        self.setupCells()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

extension BookListViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCells()  {
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.register(UINib(nibName: "BookListCell", bundle: nil), forCellWithReuseIdentifier: "BookListCell")
        
        let screenWidth = UIScreen.main.bounds.width
          let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
          layout.sectionInset = UIEdgeInsets(top: 2, left: 1, bottom: 5, right: 0)
          layout.itemSize = CGSize(width: screenWidth/3 - 1, height: 180)
          layout.minimumInteritemSpacing = 1
          layout.minimumLineSpacing = 1
          self.collection.collectionViewLayout = layout

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let books = self.authors?.books {
            return books.count
        }else{
            return authorlist.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : BookListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookListCell", for: indexPath) as! BookListCell
        if let book = self.authors?.books?[indexPath.row] {
            cell.ibBookName.text = book.bookname
               cell.ibbookimage.image = UIImage(named: "book")
               if let authorimage = book.bookimageurl {
                   if authorimage != "" {
                       let fullurl = APIList.BOOKBaseUrl + authorimage
                        cell.ibbookimage?.sd_setImage(with: URL(string: fullurl), placeholderImage: UIImage(named: "book"))
                   }
               }
        }else{
            cell.ibBookName.text = authorlist[indexPath.row].authorname
               cell.ibbookimage.image = UIImage(named: "book")
            if let authorimage = authorlist[indexPath.row].authorimage{
                   if authorimage != "" {
                       let fullurl = APIList.BOOKBaseUrl + authorimage
                        cell.ibbookimage?.sd_setImage(with: URL(string: fullurl), placeholderImage: UIImage(named: "book"))
                   }
               }
        }
        
   

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      //  let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BookReader") as? BookReader
               // vc?.bookInfo = self.books[indexPath.row]
               // self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
