//
//  IceCreamFormViewController.swift
//  IceCreamFactory
//
//  Created by Leonardo Reis on 07/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController {

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
			nameTextField.isUserInteractionEnabled = false
			nameTextField.isEnabled = false
			weightTextField.text = icecreamItem.weight
			colorTextField.text = icecreamItem.color
			flavorTextField.text = icecreamItem.flavor
			tempTextField.text = icecreamItem.temp
		}
	}
}

// MARK: Actions

extension AddViewController {
	@IBAction func cancelButton(_ sender: Any) {
		eventHandler?.cancelAddAction()
	}

	fileprivate func showAlertWithMessage(message: String) {
		let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}

	fileprivate func checkTextField(_ nameField: String, _ colorField: String, _ flavorField: String, _ tempField: String) -> Bool {
		if (nameField.isEmpty) {
			showAlertWithMessage(message: "field name is empty")
			return false
		} else if (colorField.isEmpty) {
			showAlertWithMessage(message: "field color is empty")
			return false
		} else if (flavorField.isEmpty) {
			showAlertWithMessage(message: "field flavor is empty")
			return false
		} else if (tempField.isEmpty) {
			showAlertWithMessage(message: "field temperature is empty")
			return false
		} else {
			return true
		}
	}

	@IBAction func saveButtonDidTouch(_ sender: Any) {
		guard let nameField = nameTextField.text,
		let weightField = weightTextField.text,
		let colorField = colorTextField.text,
		let flavorField = flavorTextField.text,
		let tempField = tempTextField.text else { return }

		if checkTextField(nameField, colorField, flavorField, tempField) {
			let item = IceCreamItem(name: nameField, flavor: flavorField, color: colorField, temp: tempField, weight: weightField)
			eventHandler?.saveAddAction(item)
		}
	}
}

extension AddViewController: AddItemViewInterface {
	func setIceCreamItem(_ item: IceCreamItem?) {
		iceCreamItem = item
	}
}
