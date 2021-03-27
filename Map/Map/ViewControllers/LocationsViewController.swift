//
//  LocationsViewController.swift
//  Map
//
//  Created by Adilet Absatov on 26.03.2021.
//

import UIKit
import MapKit

protocol LocationsDelegate {
    var locations: [MKPointAnnotation] {get set}
    func removeLocation(_ index: Int)
    func navigate(_ index: Int) 
}

class LocationsViewController: UITableViewController {
    var delegate: LocationsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (delegate?.locations.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = delegate?.locations[indexPath.row].title
        cell.detailTextLabel?.text = delegate?.locations[indexPath.row].subtitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.navigate(indexPath.row)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delegate?.removeLocation(indexPath.row)
            tableView.reloadData()
        }    
    }
}
