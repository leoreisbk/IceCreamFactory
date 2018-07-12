//
//  IceCreamFactoryProtocols.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 09/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import Foundation
import UIKit
import Firebase

protocol PresenterToViewProtocol: class {
	func showIceCreamList(iceCreamItems: [IceCreamItem])
	func showError();
}

protocol InterectorToPresenterProtocol: class {
	func iceCreamItemsFetched(iceCreamItems: [IceCreamItem]);
	func addItem(item: IceCreamItem)
	func iceCreamItemsFetchedFailed();
}

protocol PresentorToInterectorProtocol: class {
	var presenter: InterectorToPresenterProtocol? {get set}
	var reference: DatabaseReference {get set}
	func fetchIceCreamItems()
	func addIceCream(item: IceCreamItem)
}

protocol ViewToPresenterProtocol: class {
	var view: PresenterToViewProtocol? {get set}
	var interector: PresentorToInterectorProtocol? {get set}
	var router: PresenterToRouterProtocol? {get set}
	func addItem(item: IceCreamItem)
	func reloadData()
}

protocol PresenterToRouterProtocol: class {
	static func createModule() -> UIViewController
}
