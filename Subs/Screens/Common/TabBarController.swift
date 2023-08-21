//
//  TabBarController.swift
//  Subs
//
//  Created by Anton Vikhlyaev on 03.08.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - Tabs
    
    private enum Tabs {
        case mySubscribes
        case settings
        
        var title: String {
            switch self {
            case .mySubscribes:
                return Localization.mySubscribesTitleText
            case .settings:
                return Localization.settingsTitleText
            }
        }
        
        var imageName: String {
            switch self {
            case .mySubscribes:
                return "mail.stack.fill"
            case .settings:
                return "gearshape.fill"
            }
        }
    }
    
    // MARK: - Properties
    
    private let screenBuilder: ScreenBuilder
    
    // MARK: - Life Cycle
    
    init(screenBuilder: ScreenBuilder) {
        self.screenBuilder = screenBuilder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTabItems()
    }
    
    // MARK: - Setup TabBar
    
    private func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.selected.iconColor = .systemBlue
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue
        ]
        tabBar.standardAppearance = appearance
    }
    
    private func setupTabItems() {
        let tabs: [Tabs] = [.mySubscribes, .settings]
        
        viewControllers = tabs.map {
            switch $0 {
            case .mySubscribes:
                let viewController = screenBuilder.createMySubscribesScreen()
                viewController.title = $0.title
                return wrapInNavigationController(viewController)
            case .settings:
                let viewController = screenBuilder.createSettingsScreen()
                viewController.title = $0.title
                return wrapInNavigationController(viewController)
            }
        }
        
        viewControllers?.enumerated().forEach {
            $1.title = tabs[$0].title
            $1.tabBarItem.title = tabs[$0].title
            $1.tabBarItem.image = UIImage(systemName: tabs[$0].imageName)
            $1.tabBarItem.tag = $0
        }
    }
    
    private func wrapInNavigationController(_ vc: UIViewController) -> UINavigationController {
        UINavigationController(rootViewController: vc)
    }
}
