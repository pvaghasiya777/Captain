//
//  PDFVC.swift
//  Promise
//
//  Created by macbook on 03/07/1942 Saka.
//  Copyright © 1942 Captain. All rights reserved.
//

import UIKit

class PDFVC: UIViewController {

    @IBOutlet weak var Pdffviewar: UIWebView!
    var strurl = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        let url: URL! = URL(string: strurl)
        Pdffviewar.loadRequest(URLRequest(url: url))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
