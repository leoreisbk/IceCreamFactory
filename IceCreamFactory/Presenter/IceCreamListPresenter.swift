//
//  IceCreamListPresenter.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 11/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

class IceCreamListPresenter: ViewToPresenterProtocol {
	var view: PresenterToViewProtocol?

	var interector: PresentorToInterectorProtocol?

	var router: PresenterToRouterProtocol?

	func reloadData() {
		interector?.fetchIceCreamItems()
	}
	
	func addItem(item: IceCreamItem) {
		interector?.addIceCream(item: item)
	}
}

extension IceCreamListPresenter: InterectorToPresenterProtocol {
	func iceCreamItemsFetched(iceCreamItems: [IceCreamItem]) {
		view?.showIceCreamList(iceCreamItems: iceCreamItems)
	}

	func iceCreamItemsFetchedFailed() {
		view?.showError()
	} 
	
}
