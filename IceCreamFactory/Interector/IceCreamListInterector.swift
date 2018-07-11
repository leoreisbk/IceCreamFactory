//
//  IceCreamListInterector.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 11/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit
import Firebase

class IceCreamListInterector: PresentorToInterectorProtocol {

	let IceCreamDatabasePath = "icecream-items"

	var reference: DatabaseReference?
	var presenter: InterectorToPresenterProtocol?

	func fetchIceCreamItems() {
		reference = Database.database().reference(withPath: IceCreamDatabasePath)
		reference?.queryOrdered(byChild: "name").observe(.value, with: { snapshot in
			var newItems: [IceCreamItem] = []
			for child in snapshot.children {
				if let snapshot = child as? DataSnapshot,
					let icecreamItem = IceCreamItem(snapshot: snapshot) {
					newItems.append(icecreamItem)
				}
			}

			self.presenter?.iceCreamItemsFetched(iceCreamItems: newItems)
		})
	}
}
