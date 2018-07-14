//
//  ListWireframe.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 14/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

let IceCreamListTableViewControllerIdentifier = "IceCreamListTableViewController"

class ListWireframe: NSObject {
	var addWireframe : AddItemWireframe?
	var listPresenter : IceCreamListPresenter?
	var rootWireframe : RootWireFrame?
	var listViewController : IceCreamListTableViewController?

	func presentListInterfaceFromWindow(_ window: UIWindow) {
		let viewController = listViewControllerFromStoryboard()
		viewController.presenter = listPresenter
		listViewController = viewController
		listPresenter?.view = viewController
		rootWireframe?.showRootViewController(viewController, inWindow: window)
	}

	func presentAddInterface() {
		addWireframe?.presentAddInterfaceFromViewController(listViewController!)
	}

	func listViewControllerFromStoryboard() -> IceCreamListTableViewController {
		let storyboard = mainStoryboard()
		let viewController = storyboard.instantiateViewController(withIdentifier: IceCreamListTableViewControllerIdentifier) as! IceCreamListTableViewController
		return viewController
	}

	func mainStoryboard() -> UIStoryboard {
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		return storyboard
	}

}
