//
//  NewsViewController.swift
//  KBTUApp
//
//  Created by Adilet Absatov on 09.03.2021.
//

import UIKit

class NewsViewController: UITableViewController, AddNews {
    private var newsList: [News] = [
        News.init("Presentation of certificates and medals to the best teachers of the university 2020", "Professors of KBTU Isakhov Asylbek and Kulpeshov Beibut became the holders of the title The best teacher of the university 2020! On March 17, 2021, the Rector of KBTU, Chairman of the Board Ibrashev Kenzhebek proudly presented certificates and medals to the professors of KBTU!", UIImage.init(named: "news1")!, Date(timeIntervalSinceReferenceDate: 100000)),
        News.init("Republican subject olympiad KBTU!", "Dear students and college graduates! We are pleased to announce to you the holding of the KBTU Republican Subject Olympiad among among students in grades 10-12 and college graduates! (citizens of the Republic of Kazakhstan). The winners of the Olympiad will receive GRANTS and DISCOUNTS for studying at KBTU!", UIImage.init(named: "news2")!, Date(timeIntervalSinceReferenceDate: 32413123)),
        News.init("Academic skills preparation course", "The Academic Skills course is aiming at an earlier immersion of high school graduates, would-be Bachelor students in the academic environment. The course is designed for those who would like to master their learning competencies, to get familiarized with main aspects of studying at university, and to acquire basic skills for effective academic activities.", UIImage.init(named: "news3")!, Date(timeIntervalSinceReferenceDate: 4531534)),
    ]

    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.isEnabled = false
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCell
        cell?.title.text = newsList[indexPath.row].title
        cell?.date.text = changeFormat(newsList[indexPath.row].date!)
        return cell!
    }
    
    func changeFormat(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        let result = dateFormatter.string(from: date)
        return result
    }
    
    func addNews(_ title: String, _ text: String, _ image: UIImage) {
        newsList.append(News.init(title, text, image, Date()))
        tableView.reloadData()
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            let index = (tableView.indexPathForSelectedRow?.row)!
            destination.titlePreload = newsList[index].title
            destination.textPreload = newsList[index].text
            destination.imagePreload = newsList[index].image
            destination.datePreload = changeFormat(newsList[index].date!)
        } else if segue.identifier == "addSegue" {
            if let navcon = segue.destination as? UINavigationController {
                if let destination = navcon.visibleViewController as? AddNewsViewController {
                    destination.delegate = self
                }
            }
        }
    }
}
