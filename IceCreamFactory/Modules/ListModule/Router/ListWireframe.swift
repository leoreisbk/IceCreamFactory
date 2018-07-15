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
	var listPresenter : ListPresenter?
	var rootWireframe : RootWireFrame?
	var listViewController : ListViewController?

	func presentListInterfaceFromWindow(_ window: UIWindow) {
		let viewController = listViewControllerFromStoryboard()
		viewController.eventHandler = listPresenter
		listViewController = viewController
		listPresenter?.userInterface = viewController
		rootWireframe?.showRootViewController(viewController, inWindow: window)
	}

	func presentAddInterface() {
		addWireframe?.presentAddInterfaceFromViewController(listViewController!, item: nil)
	}

	func presentEditInterface(item: IceCreamItem) {
		addWireframe?.presentAddInterfaceFromViewController(listViewController!, item: item)
	}

	func listViewControllerFromStoryboard() -> ListViewController {
		let storyboard = mainStoryboard()
		let viewController = storyboard.instantiateViewController(withIdentifier: IceCreamListTableViewControllerIdentifier) as! ListViewController
		return viewController
	}

	func mainStoryboard() -> UIStoryboard {
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		return storyboard
	}

}
