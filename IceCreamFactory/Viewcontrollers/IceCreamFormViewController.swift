//
//  IceCreamFormViewController.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 07/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit
import Firebase

class IceCreamFormViewController: UIViewController {

	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var weightTextField: UITextField!
	@IBOutlet weak var colorTextField: UITextField!
	@IBOutlet weak var flavorTextField: UITextField!
	@IBOutlet weak var tempTextField: UITextField!

	var iceCreamItem: IceCreamItem?

	var eventHandler : AddItemModuleInterface?

	override func viewDidLoad() {
        super.viewDidLoad()
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if let icecreamItem = iceCreamItem {
			nameTextField.text = icecreamItem.name
			weightTextField.text = icecreamItem.weight
			colorTextField.text = icecreamItem.color
			flavorTextField.text = icecreamItem.flavor
			tempTextField.text = icecreamItem.temp
		}
	}
}

// MARK: Actions

extension IceCreamFormViewController {
	@IBAction func cancelButton(_ sender: Any) {
		eventHandler?.cancelAddAction()
	}

	@IBAction func saveButtonDidTouch(_ sender: Any) {
		guard let nameField = nameTextField.text,
		let weightField = weightTextField.text,
		let colorField = colorTextField.text,
		let flavorField = flavorTextField.text,
		let tempField = tempTextField.text else { return }

		let item = IceCreamItem(name: nameField, flavor: flavorField, color: colorField, temp: tempField, weight: weightField)
		eventHandler?.saveAddAction(item)
	}
}
