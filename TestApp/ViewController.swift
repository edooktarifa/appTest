//
//  ViewController.swift
//  TestApp
//
//  Created by Phincon on 24/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(OnBoardCell.self, forCellWithReuseIdentifier: "onboard")
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    lazy var startedBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("GET STARTED", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.layer.cornerRadius = 20
        btn.backgroundColor = .green
        return btn
    }()
    
    lazy var pageControl: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.numberOfPages = 3
        return page
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addSubviewViews()
        setupConstraint()
    }
    
    //MARK: - addSubviews view
    func addSubviewViews(){
        view.backgroundColor = .white
        startedBtn.addTarget(self, action: #selector(moveToDetailScreen), for: .touchUpInside)
        
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.currentPageIndicatorTintColor = .green
        
        [collectionView, startedBtn, pageControl].forEach { views in
            view.addSubview(views)
        }
    }
    
    @objc func moveToDetailScreen(){
        present(DetailViewController(), animated: true)
    }

    //MARK: -setup constraint collectionview and button
    func setupConstraint(){
        //MARK: - setup constraint collection
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            pageControl.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 40),
            pageControl.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        //MARK: - setup constraint started button
        NSLayoutConstraint.activate([
            startedBtn.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 10),
            startedBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            startedBtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            startedBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            startedBtn.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onboard", for: indexPath) as? OnBoardCell else { return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 70)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        pageControl.currentPage = Int(index)
    }
}
