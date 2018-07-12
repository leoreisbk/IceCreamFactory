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

	var ref: DatabaseReference!
	var iceCreamItem: IceCreamItem?

	override func viewDidLoad() {
        super.viewDidLoad()
		ref = Database.database().reference(withPath: "icecream-items")
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
	fileprivate func dismissForm() {
		self.dismiss(animated: true, completion: nil)
	}

	@IBAction func cancelButton(_ sender: Any) {
		dismissForm()
	}

	@IBAction func saveButtonDidTouch(_ sender: Any) {
		guard let nameField = nameTextField.text,
		let weightField = weightTextField.text,
		let colorField = colorTextField.text,
		let flavorField = flavorTextField.text,
		let tempField = tempTextField.text else { return }

		let icecreamItem = IceCreamItem(name: nameField, flavor: flavorField, color: colorField, temp: tempField, weight: weightField)

		let icecreamItemRef = self.ref.child((nameField.lowercased()))
		icecreamItemRef.setValue(icecreamItem.toAnyObject())
		dismissForm()
	}
}