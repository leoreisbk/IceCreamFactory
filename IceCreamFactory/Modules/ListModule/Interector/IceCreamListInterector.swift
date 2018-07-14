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
	var reference: DatabaseReference?
	var presenter: InterectorToPresenterProtocol?

	func fetchIceCreamItems() {
		reference = Database.database().reference(withPath: Constants.PATH)
		reference?.queryOrdered(byChild: Constants.QUERY_CHILD).observe(.value, with: { snapshot in
			var newItems: [IceCreamItem] = []
			if snapshot.exists() {
				for child in snapshot.children {
					if let snapshot = child as? DataSnapshot,
						let icecreamItem = IceCreamItem(snapshot: snapshot) {
						newItems.append(icecreamItem)
					}
				}
				self.presenter?.iceCreamItemsFetched(iceCreamItems: newItems)
			} else {
				self.presenter?.iceCreamItemsFetchedFailed()
			}
		})
	}
	
//	func addIceCream(item: IceCreamItem) {
//		reference = Database.database().reference(withPath: Constants.PATH)
//		let itemReference = reference?.child(Constants.QUERY_CHILD)
//		itemReference?.setValue(item.toAnyObject())
//		presenter?.addItem(item: item)
//	}
}
