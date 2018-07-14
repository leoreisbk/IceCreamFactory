//
//  AddItemPresenter.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 14/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

class AddItemPresenter : NSObject {
	var addInteractor : AddItemInteractor?
	var addWireframe : AddItemWireframe?
	var addModuleDelegate : AddItemModuleDelegate?
}

// MARK: AddItemModuleInterface 
extension AddItemPresenter: AddItemModuleInterface {
	func cancelAddAction() {
		addWireframe?.dismissAddInterface()
		addModuleDelegate?.addModuleDidCancelAddAction()
	}

	func saveAddAction(_ item: IceCreamItem) {
		addInteractor?.saveNewEntry(item)
		addWireframe?.dismissAddInterface()
		addModuleDelegate?.addModuleDidSaveAddAction()
	}
}
