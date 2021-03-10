//
//  BrowserModel.swift
//  Browser
//
//  Created by Adilet Absatov on 25.02.2021.
//

import Foundation
import UIKit

class BrowserModel {
    private var websites: [Website] = [
        Website.init(title: "Twitter", link: URL(string: "https://www.twitter.com")!, isFavourite: false),
        Website.init(title: "Google", link: URL(string: "https://www.google.com")!, isFavourite: false),
    ]
    
    private var displayWebsites: [Website] = [
        Website.init(title: "Twitter", link: URL(string: "https://www.twitter.com")!, isFavourite: false),
        Website.init(title: "Google", link: URL(string: "https://www.google.com")!, isFavourite: false),
    ]
    
    private var currentLink: URL?
    private var isFavourite: Bool = false
    
    func getWebsitesListLength() -> Int {
        return displayWebsites.count
    }
    
    func getCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") 
        cell?.textLabel?.text = displayWebsites[indexPath.row].title
        return cell!
    }
    
    func prepareDestination(_ destination: WebsiteViewController, _ index: Int) {
        destination.navigationItem.title = displayWebsites[index].title
        currentLink = displayWebsites[index].link
        isFavourite = displayWebsites[index].isFavourite
    }
    
    func addWebsite(_ title: String, _ link: String) {
        if title != "" && link != "" {
            if !websites.contains(where: {$0.title == title}) {
                if let url = URL(string: link) {
                    websites.append(Website.init(title: title, link: url, isFavourite: false))
                    displayWebsites = websites
                }
            }
        }
    }
    
    func showAll() {
        displayWebsites = websites
    }
    
    func showFavourites() {
        displayWebsites = websites.filter({website in return website.isFavourite})
    }
    
    func getCurrentLink() -> URL? {
        return currentLink
    }
    
    func getIsFavourite() -> Bool {
        return isFavourite
    }
    
    func handleFavourite(_ title: String) -> Bool {
        var added: Bool?
        for i in 0...websites.count {
            if websites[i].title == title {
                websites[i].isFavourite = !websites[i].isFavourite
                added = websites[i].isFavourite
                break
            }
        }
        for i in 0...displayWebsites.count {
            if displayWebsites[i].title == title {
                displayWebsites[i].isFavourite = !displayWebsites[i].isFavourite
                break
            }
        }
        return added!
    }
}
