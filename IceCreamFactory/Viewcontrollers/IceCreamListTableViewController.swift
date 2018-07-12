//
//  IceCreamListTableViewController.swift
//  IceCreamStore
//
//  Created by Leonardo Reis on 06/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit
import Firebase

class IceCreamListTableViewController: UIViewController {

	// MARK: Constants
	let IceCreamSegue = "IceCreamSegue"
	let IceCreamDatabasePath = "icecream-items"

	var presenter: ViewToPresenterProtocol?

	var items: [IceCreamItem] = [] {
		didSet {
			self.tableView.reloadData()
		}
	}
	var ref: DatabaseReference!

	@IBOutlet weak var tableView: UITableView!
}

// MARK: View controller life cycle 

extension IceCreamListTableViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		self.presenter?.reloadData()
	}
}

// MARK: UITableView Delegate

extension IceCreamListTableViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "IceCreamCell", for: indexPath) as! IceCreamTableViewCell
		let icecreamItem = items[indexPath.row]
		cell.setupCell(icecreamItem)
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let iceCreamItem = items[indexPath.row]
		self.performSegue(withIdentifier: IceCreamSegue, sender: iceCreamItem)
	}

	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			let icecreamItem = items[indexPath.row]
			icecreamItem.ref?.removeValue()
		}
	}
}

// MARK: Actions
extension IceCreamListTableViewController {
	@IBAction func addButtonDidTouch(_ sender: AnyObject) {
		self.performSegue(withIdentifier: IceCreamSegue, sender: -1)
	}
}


// MARK: Perform
extension IceCreamListTableViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == IceCreamSegue {
			let navigationVC = segue.destination as! UINavigationController
			let formViewcontroller = navigationVC.viewControllers.first as! IceCreamFormViewController

			if let iceCreamItem = sender as? IceCreamItem {
				formViewcontroller.iceCreamItem = iceCreamItem
			}
		}
	}
}

// MARK: Presenter to view protocol
extension IceCreamListTableViewController: PresenterToViewProtocol {
	func showIceCreamList(iceCreamItems: [IceCreamItem]) {
		self.items = iceCreamItems
	}

	func showError() {
		let alert = UIAlertController(title: "Alert", message: "Problem Fetching Ice Creams", preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}
}
