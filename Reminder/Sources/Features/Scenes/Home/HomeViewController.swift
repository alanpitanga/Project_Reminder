//
//  HomeViewController.swift
//  Reminder
//
//  Created by Alan Pitanga on 30/03/25.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    let contentView: HomeView
    public weak var flowDelegate: HomeFlowDelegate?
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate ) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindView()
        setup()
    }
    
    private func setupBindView() {
        self.view = contentView
    }
    
    private func setup() {
        buildHieranchy()
    }
    
    private func buildHieranchy() {
        setupContentViewToBounds(contentView: contentView)
    }
    
}
