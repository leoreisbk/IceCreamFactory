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
	}

	func configureDependencies() {
		let rootWireframe = RootWireFrame()

		let listPresenter = ListPresenter()
//		let listDataManager = ListDataManager()
		let listInteractor = ListInteractor()

		let addWireframe = AddItemWireframe()
		let addInteractor = AddItemInteractor()
		let addPresenter = AddItemPresenter()
//		let addDataManager = AddDataManager()

		listInteractor.output = listPresenter

		listPresenter.listInteractor = listInteractor
		listPresenter.listWireframe = listWireframe

		listWireframe.addWireframe = addWireframe
		listWireframe.listPresenter = listPresenter
		listWireframe.rootWireframe = rootWireframe

		addWireframe.addPresenter = addPresenter

		addPresenter.addWireframe = addWireframe
		addPresenter.addModuleDelegate = listPresenter
		addPresenter.addInteractor = addInteractor

	}
}
