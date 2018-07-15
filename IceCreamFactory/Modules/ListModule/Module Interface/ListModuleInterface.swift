//
//  ListModuleInterface.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 15/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

protocol ListModuleInterface {
	func addNewItem()
	func reloadView()
	func editItem(_ item: IceCreamItem)
}

