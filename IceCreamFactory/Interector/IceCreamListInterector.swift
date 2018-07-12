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

	var reference: DatabaseReference = Database.database().reference(withPath: Constants.PATH)
	var presenter: InterectorToPresenterProtocol?

	func fetchIceCreamItems() {
		reference.queryOrdered(byChild: Constants.QUERY_CHILD).observe(.value, with: { snapshot in
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
	
	func addIceCream(item: IceCreamItem) {
		let itemReference = reference.child(Constants.QUERY_CHILD)
		itemReference.setValue(item.toAnyObject())
		presenter?.addItem(item: item)
	}
}
