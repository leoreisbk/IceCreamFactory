//
//  ListPresenter.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 15/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

class ListPresenter: NSObject {
	var listInteractor : ListInteractorInput?
	var listWireframe : ListWireframe?
	var userInterface : ListViewInterface?
}

// MARK: ListModuleInterface

extension ListPresenter: ListModuleInterface {
	func addNewEntry() {
		listWireframe?.presentAddInterface()
	}

	func updateView() {
		listInteractor?.fetchIceCreamItems()
	}
}

// MARK: AddItemModuleDelegate

extension ListPresenter: AddItemModuleDelegate {
	func addModuleDidCancelAddAction() {

	}

	func addModuleDidSaveAddAction() {
		updateView()
	}
}

// MARK: ListInteractorInput

extension ListPresenter: ListInteractorOutput {
	func iceCreamItemsFetched(_ items: [IceCreamItem]) {
		if items.count == 0 {
			userInterface?.showNoContentMessage()
		} else {
			userInterface?.showIceCreamList(iceCreamItems: items)
		}
	}
}
