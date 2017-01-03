//
//  RootViewController.swift
//  JMNews
//
//  Created by maic on 2017/1/3.
//  Copyright © 2017年 Galaxy. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        setUpChildController()
    }
    
    
    func initView() {
        delegate = self
        self.tabBar.isOpaque = false
    }
    
    private func setUpChildController() {
        let newsVc = NewsViewController()
        
        newsVc.tabBarItem.title = "资讯"
        newsVc.tabBarItem.selectedImage = UIImage(named:"tabbar_icon_news_highlight")?.withRenderingMode(.alwaysOriginal)
        newsVc.tabBarItem.image = UIImage(named:"tabbar_icon_news_normal")?.withRenderingMode(.alwaysOriginal)
        newsVc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:NAVIGATIONBAR_RED_COLOR
], for: .highlighted)
        //之前是默认渲染的，如果不设置图片为alwaysOriginal，会被渲染成单一的颜色
        let newsNavVc = UINavigationController(rootViewController:newsVc)
        
        
        let photoVc = PhotoViewController()
        photoVc.tabBarItem.title = "图秀"
        photoVc.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_media_highlight")?.withRenderingMode(.alwaysOriginal)
        photoVc.tabBarItem.image = UIImage(named:"tabbar_icon_media_normal")?.withRenderingMode(.alwaysOriginal)
        photoVc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:NAVIGATIONBAR_RED_COLOR], for: .highlighted)
        let photoNavVc = UINavigationController(rootViewController:photoVc)
        
        let hotVc = HotViewController()
        hotVc.title = "热门"
        hotVc.tabBarItem.title = "热门"
        hotVc.tabBarItem.selectedImage = UIImage(named:"tabbar_icon_reader_highlight")?.withRenderingMode(.alwaysOriginal)
        hotVc.tabBarItem.image = UIImage(named:"tabbar_icon_reader_normal")?.withRenderingMode(.alwaysOriginal)
        hotVc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:NAVIGATIONBAR_RED_COLOR], for: .highlighted)
        let hotNavVc = UINavigationController(rootViewController:hotVc)
        
        
        let setVc = SetViewController()
        setVc.tabBarItem.title = "我"
        setVc.tabBarItem.selectedImage = UIImage(named:"tabbar_icon_me_highlight")?.withRenderingMode(.alwaysOriginal)
        setVc.tabBarItem.image = UIImage(named:"tabbar_icon_me_normal")?.withRenderingMode(.alwaysOriginal)
        setVc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:NAVIGATIONBAR_RED_COLOR], for: .highlighted)
        let setNavVc = UINavigationController(rootViewController:setVc)
        
        self.viewControllers = [newsNavVc,photoNavVc,hotNavVc,setNavVc]
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//MARK - UITabBarControllerDelegate
extension RootViewController:UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("切换到\(viewController)")
        
        let index = childViewControllers.index(of: viewController)
        
        
        
        //判断目标控制器是否是 UIViewController 不包含子类
        return !viewController.isMember(of: UIViewController.self)
    }
    
    
    
}



