//
//  AppDependencies.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 14/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

class AppDependencies {

	let listWireframe = ListWireframe()

	 init() {
		configureDependencies()
	}

	func installRootViewControllerIntoWindow(_ window: UIWindow) {
		listWireframe.presentListInterfaceFromWindow(window)
//		let iceCreamList = IceCreamFactoryRouter.createModule();
	}

	func configureDependencies() {

		let rootWireframe = RootWireFrame()

		let addWireframe = AddItemWireframe()
		let addInteractor = AddItemInteractor()
		let addPresenter = AddItemPresenter()

		addWireframe.addPresenter = addPresenter

		addPresenter.addWireframe = addWireframe
//		addPresenter.addItemModuleDelegate = listPresenter
		addPresenter.addInteractor = addInteractor

		listWireframe.addWireframe = addWireframe
//		listWireframe.listPresenter = listPresenter
		listWireframe.rootWireframe = rootWireframe
		
	}
}
