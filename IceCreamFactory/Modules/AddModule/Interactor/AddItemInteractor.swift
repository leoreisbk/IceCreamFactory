//
//  AddItemInterector.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 14/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit
import Firebase

class AddItemInteractor {
	var reference: DatabaseReference?

	func saveNewEntry(_ item: IceCreamItem) {
		reference = Database.database().reference(withPath: Constants.PATH_CHILD)
		let itemReference = reference?.child("icecreams/\(item.name)")
		itemReference?.setValue(item.toAnyObject())
	}
}
