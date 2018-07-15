//
//  AddItemWireframe.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 14/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

let IceCreamFormViewControllerIdentifier = "IceCreamFormViewController"

class AddItemWireframe: NSObject {
	var addPresenter : AddItemPresenter?
	var presentedViewController : UIViewController?

	func presentAddInterfaceFromViewController(_ viewController: UIViewController) {
		let newViewController = addViewController()
		newViewController.eventHandler = addPresenter
		viewController.present(newViewController, animated: true, completion: nil)

		presentedViewController = newViewController
	}

	func dismissAddInterface() {
		presentedViewController?.dismiss(animated: true, completion: nil)
	}

	func addViewController() -> AddViewController {
		let storyboard = mainStoryboard()
		let addViewController: AddViewController = storyboard.instantiateViewController(withIdentifier: IceCreamFormViewControllerIdentifier) as! AddViewController
		return addViewController
	}

	func mainStoryboard() -> UIStoryboard {
		let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
		return storyboard
	}
}
