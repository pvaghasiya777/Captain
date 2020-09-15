//
//  DrwaingViewVC_3.swift
//  Promise
//
//  Created by macbook on 03/06/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class DrwaingViewVC_3: UIViewController {

        @IBOutlet weak var tbl_DrwaingView: UITableView!
        
        var arrviewData = [DrwaingViewModel]()
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        

    }

    extension DrwaingViewVC_3 : UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return (section == 0) ? 1 : arrviewData.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell : DrwaingViewCell_1 = tableView.dequeueReusableCell(withIdentifier: "DrwaingViewCell_1") as! DrwaingViewCell_1
            return cell
        }
    }
