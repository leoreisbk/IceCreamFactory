//
//  RootWireFrame.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 14/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

class RootWireFrame: NSObject {
	func showRootViewController(_ viewController: UIViewController, inWindow: UIWindow) {
		let navigationController = navigationControllerFromWindow(inWindow)
		navigationController.viewControllers = [viewController]
	}

	func navigationControllerFromWindow(_ window: UIWindow) -> UINavigationController {
		let navigationController = window.rootViewController as! UINavigationController
		return navigationController
	}
}
