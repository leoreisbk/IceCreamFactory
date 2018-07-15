//
//  ListViewInterface.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 15/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

protocol ListViewInterface {
	func showNoContentMessage()
	func showIceCreamList(iceCreamItems: [IceCreamItem])
	func reloadEntries()
}
