//
//  AddItemModuleInterface.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 14/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit

protocol AddItemModuleInterface {
	func cancelAddAction()
	func saveAddAction(_ item: IceCreamItem)
}
