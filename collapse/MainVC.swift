//
//  MainVC.swift
//  collapse
//
//  Created by Khaled Rahman Ayon on 08.08.19.
//  Copyright © 2019 Khaled Rahman Ayon. All rights reserved.
//

import UIKit

class MainVC: UITableViewController {
        
    var cellData = [
        CellData(title: "Title 1", descriptionTitle: "Description 1", shouldCollapse: true),
        CellData(title: "Title 2", descriptionTitle: "I’m not sure if it is a bug or not. But the problem was also mentioned by UseYourLoaf. When the table view is first displayed, you may find some of the cells are not sized properly. But when you scroll the table view, the new cells are displayed with correct row height", shouldCollapse: true),
        CellData(title: "Title 3", descriptionTitle: "Description 3", shouldCollapse: false),
        CellData(title: "Title 4", descriptionTitle: "I’m not sure if it is a bug or not. But the problem was also mentioned by UseYourLoaf. When the table view is first displayed, you may find some of the cells are not sized properly.", shouldCollapse: true),
        CellData(title: "Title 5", descriptionTitle: "I’m not sure if it is a bug or not. But the problem was also mentioned by UseYourLoaf. When the table view is first displayed, you may find some of the cells are not sized properly.I’m not sure if it is a bug or not. But the problem was also mentioned by UseYourLoaf. When the table view is first displayed, you may find some of the cells are not sized properly. I’m not sure if it is a bug or not. But the problem was also mentioned by UseYourLoaf. When the table view is first displayed, you may find some of the cells are not sized properly.", shouldCollapse: true)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 40
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.register(MyCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        cell.title.text = cellData[indexPath.row].title
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MyCell
        
        cell.descriptionLabel.isHidden.toggle()
        if cellData[indexPath.row].shouldCollapse {
            cell.descriptionLabel.text = cellData[indexPath.row].descriptionTitle
            UIView.transition(with: tableView, duration: 0.2, options: .transitionCrossDissolve, animations: {
                self.tableView.reloadData()
            })
        }
    }
}

