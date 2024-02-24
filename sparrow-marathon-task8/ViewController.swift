//
//  ViewController.swift
//  sparrow-marathon-task8
//
//  Created by Nikita Bekish on 23.02.2024.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Private properties

    private let avatar = UIImageView(image: UIImage(systemName: "person.crop.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 36))?.withTintColor(.systemGray4, renderingMode: .alwaysOriginal))
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Avatar"
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        return label
    }()

    private let scrollView = UIScrollView()
    
    let navBarAppearance = UINavigationBarAppearance()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        view.addSubview(scrollView)
        scrollView.delegate = self
        
        scrollView.addSubview(avatar)
        scrollView.addSubview(titleLabel)
        
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        avatar.frame = CGRect(x: self.view.bounds.width - 48, y: 0, width: 36, height: 36)
        titleLabel.frame = CGRect(x: 12, y: 0, width: 200, height: 36)
        
        scrollView.contentSize = .init(width: view.frame.width, height: 2000)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + scrollView.safeAreaInsets.top

        if y < 36 {
            navBarAppearance.configureWithTransparentBackground()
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.backgroundColor = .systemGray6
            
            self.title = ""
        } else {
            navBarAppearance.configureWithOpaqueBackground()
            navigationController?.navigationBar.standardAppearance = navBarAppearance

            self.title = "Avatar"
        }
    }
    
}

