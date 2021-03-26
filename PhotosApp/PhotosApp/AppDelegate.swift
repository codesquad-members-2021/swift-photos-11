//
//  AppDelegate.swift
//  PhotosApp
//
//  Created by 심영민 on 2021/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var navigationController: UINavigationController!
    var doodleCollectionViewController: DoodleCollectionViewController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        doodleCollectionViewController = DoodleCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController = UINavigationController(rootViewController: doodleCollectionViewController)
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

