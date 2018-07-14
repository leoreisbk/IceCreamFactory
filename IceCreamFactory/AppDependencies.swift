//
//  AppDependencies.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 14/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

class AppDependencies {

	 init() {
		configureDependencies()
	}

	func installRootViewControllerIntoWindow(_ window: UIWindow) {
//		listWireframe.presentListInterfaceFromWindow(window)
		let iceCreamList = IceCreamFactoryRouter.createModule();
		window.rootViewController = iceCreamList
		window.makeKeyAndVisible()

	}

	func configureDependencies() {
	}
}
