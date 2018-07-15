//
//  IceCreamListTableViewController.swift
//  IceCreamStore
//
//  Created by Leonardo Reis on 06/07/18.
//  Copyright © 2018 Leonardo Reis. All rights reserved.
//

import UIKit
import Firebase

class ListViewController: UIViewController, ListViewInterface {
	var eventHandler : ListModuleInterface?

	var items: [IceCreamItem] = [] {
		didSet {
			self.tableView.reloadData()
		}
	}

	@IBOutlet weak var tableView: UITableView!
}

// MARK: View controller life cycle

extension ListViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		eventHandler?.updateView()
	}
}

// MARK: UITableView Delegate

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CELL_ID, for: indexPath) as! IceCreamTableViewCell
		let icecreamItem = items[indexPath.row]
		cell.setupCell(icecreamItem)
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let iceCreamItem = items[indexPath.row]
		self.performSegue(withIdentifier: Constants.ICECREAM_SEGUE, sender: iceCreamItem)
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
extension ListViewController {
	@IBAction func addButtonDidTouch(_ sender: AnyObject) {
		eventHandler?.addNewEntry()
//		self.performSegue(withIdentifier: Constants.ICECREAM_SEGUE, sender: -1)
	}
}


// MARK: Perform
extension ListViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == Constants.ICECREAM_SEGUE {
			let navigationVC = segue.destination as! UINavigationController
			let formViewcontroller = navigationVC.viewControllers.first as! AddViewController

			if let iceCreamItem = sender as? IceCreamItem {
				formViewcontroller.iceCreamItem = iceCreamItem
			}
		}
	}
}

// MARK: Presenter to view protocol
extension ListViewController {
	func showNoContentMessage() {
		let alert = UIAlertController(title: "Alert", message: "Problem Fetching Ice Creams", preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}

	func reloadEntries() {
		tableView.reloadData()
	}

	func showIceCreamList(iceCreamItems: [IceCreamItem]) {
		self.items = iceCreamItems
		reloadEntries()
	}
}
