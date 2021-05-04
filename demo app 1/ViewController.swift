//
//  ViewController.swift
//  demo app 1
//
//  Created by Anil Sharma on 04/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView : UITableView!
    var lettersArray: [Character]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let aScalars = "A".unicodeScalars
        let aCode = aScalars[aScalars.startIndex].value

        lettersArray = (0..<26).map {
            i in Character(UnicodeScalar(aCode + i) ?? "A")
        }

        // Do any additional setup after loading the view.
    }
    
    
    
}

extension ViewController : UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return lettersArray.count}
        else {
            return 10
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell {
            if indexPath.section == 0 {
                cell.titleLbl.text = "\(lettersArray[indexPath.row])"
            }else {
                cell.titleLbl.text = "\(indexPath.row + 1)"
            }
            return cell;
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableHeaderViewCell") as! TableHeaderViewCell
        cell.titleLbl.text = section == 0 ? "Alphabet" : "Numbers"
        cell.contentView.backgroundColor = UIColor.white
        return cell.contentView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 51
    }
    
    
}



class TableViewCell: UITableViewCell {
    @IBOutlet var titleLbl : UILabel!
    
}


class TableHeaderViewCell: UITableViewCell {
    @IBOutlet var titleLbl : UILabel!
}
