//
//  ListInteractor.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 15/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit
import Firebase

protocol ListInteractorInput {
	func fetchIceCreamItems()
}

protocol ListInteractorOutput {
	func iceCreamItemsFetched(_ items: [IceCreamItem])
}

class ListInteractor: NSObject, ListInteractorInput {
	var reference: DatabaseReference?
	var output: ListInteractorOutput?

	func fetchIceCreamItems() {
		reference = Database.database().reference(withPath: Constants.PATH)
		reference?.observe(.value, with: { snapshot in
//		reference?.queryOrdered(byChild: Constants.PATH).observe(.value, with: { snapshot in
			var newItems: [IceCreamItem] = []
			for child in snapshot.children {
				if let snapshot = child as? DataSnapshot,
					let icecreamItem = IceCreamItem(snapshot: snapshot) {
					newItems.append(icecreamItem)
				}
			}
			self.output?.iceCreamItemsFetched(newItems)
		})


	}

}
