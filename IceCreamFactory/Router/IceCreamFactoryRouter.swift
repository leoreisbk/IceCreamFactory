//
//  IceCreamFactoryRouter.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 09/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

class IceCreamFactoryRouter: PresenterToRouterProtocol {
	static func createModule() -> UIViewController {
		let icecreamTableViewController = mainstoryboard.instantiateViewController(withIdentifier: "IceCreamListTableViewController") as! IceCreamListTableViewController
		//if let view = navController.childViewControllers.first as? LiveNewsViewController {
		let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = IceCreamListPresenter()
		let interactor: PresentorToInterectorProtocol = IceCreamListInterector()
		let router: PresenterToRouterProtocol = IceCreamFactoryRouter()

		icecreamTableViewController.presenter = presenter
		presenter.view = icecreamTableViewController
		presenter.router = router
		presenter.interector = interactor
		interactor.presenter = presenter

		return icecreamTableViewController

		//}

		//return UIViewController()
	}
}

extension IceCreamFactoryRouter {
	static var mainstoryboard: UIStoryboard{
		return UIStoryboard(name:"Main",bundle: Bundle.main)
	}
}
