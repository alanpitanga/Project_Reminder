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
        self.flowDelegate = flowDelegate
        self.contentView = contentView
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
    }
    
}
