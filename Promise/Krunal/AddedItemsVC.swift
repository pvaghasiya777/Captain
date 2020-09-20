//
//  AddedItemsVC.swift
//  report
//
//  Created by macbook on 05/06/1942 Saka.
//  Copyright © 1942 com.mac. All rights reserved.
//

import UIKit

class AddedItemsVC: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tbl_AddedItems: UITableView!
    @IBOutlet var lbl_ShowCount: UILabel!
    var Arr_PLDetail = [PlreportDetailModel]()
    var IndexpathRow = 0
    //MARK:- variable
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
//MARK:- TableView Initialization
extension AddedItemsVC : UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return Arr_PLDetail[0].inputMasterIDS?[0].inputSingleIDS!.count ?? Arr_PLDetail.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell : AddedItemsHeaderCell = tableView.dequeueReusableCell(withIdentifier: "AddedItemsHeaderCell") as! AddedItemsHeaderCell
            return cell
        } else {
            let cell : AddedItemsCell = tableView.dequeueReusableCell(withIdentifier: "AddedItemsCell") as! AddedItemsCell
            self.lbl_ShowCount.text = "Showing 1 to \(Arr_PLDetail[0].inputMasterIDS![0].inputSingleIDS!.count) of \(Arr_PLDetail[0].inputMasterIDS![0].inputSingleIDS!.count) results"
            cell.DisplayCell(Arr_Data: Arr_PLDetail, indexpath: indexPath)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}






