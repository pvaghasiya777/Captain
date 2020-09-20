//
//  DocumentVC.swift
//  Promise
//
//  Created by Captain on 15/09/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class DocumentVC: UIViewController {

    @IBOutlet weak var sampleTreeView: CITreeView!
    var data : [CITreeViewData] = []
    let treeViewCellIdentifier = "TreeViewCellIdentifier"
    let treeViewCellNibName = "CITreeViewCell"
    var Home_Barbutton: UIBarButtonItem!
    var arrFinal : NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.InitlizationView()
    }
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    func InitlizationView() {
        sampleTreeView.register(UINib(nibName: treeViewCellNibName, bundle: nil), forCellReuseIdentifier: treeViewCellIdentifier)
        sampleTreeView.expandAllRows()
        sampleTreeView.reloadDataWithoutChangingRowStates()
        MasterServiceCall.shareInstance.Get_Document(Api_Str: Api_Urls.GET_API_Document, Viewcontroller: self)
        self.Load_Dashboard()
    }
    func Load_Dashboard() {
        self.Home_Barbutton = Utils.Get_Navigation_Bar_Button(str_Iconname: "ic_dashboard", action: #selector(SWRevealViewController.revealToggle(_:)), viewController: self.revealViewController())
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        self.navigationItem.setLeftBarButton(Home_Barbutton, animated: true)
    }
    @IBAction func reloadBarButtonAction(_ sender: UIBarButtonItem) {
        sampleTreeView.expandAllRows()
    }
    func getDefaultCITreeViewData(arr_data : NSDictionary) {
        let dic : NSDictionary =  arr_data.value(forKey: "Cabinet") as! NSDictionary
        let rootKeys : NSArray = NSArray(array: dic.allKeys)
        for i in 0..<rootKeys.count {
            if dic.value(forKey: rootKeys[i] as! String) as? NSArray != nil {
                let files : NSArray = NSArray(array: dic.value(forKey: rootKeys[i] as! String) as! NSArray)
                print("Cabinet")
                print(files)
                var arrChilds : [CITreeViewData] = []
                for file in files {
                    arrChilds.append( CITreeViewData(name: file as! String))
                }
                let parent1 = CITreeViewData(name: rootKeys[i] as! String, children: arrChilds)
                //print(arrChilds)
                self.arrFinal.add(parent1)//([String(describing: rootKeys[i]) : files])
            } else if dic.value(forKey: rootKeys[i] as! String) as? NSDictionary != nil {
                let anotherLevel : NSDictionary = NSDictionary(dictionary: dic.value(forKey: rootKeys[i] as! String) as! NSDictionary)
                let obj = CITreeViewData(name: String(describing: rootKeys[i]), children: self.ParseDictionary(levelDic: anotherLevel, dicName: String(describing: rootKeys[i])))
                self.arrFinal.add(obj)
            }
        }
        print(arrFinal)
        self.data = [CITreeViewData(name: "Cabinet", children: self.arrFinal as! [CITreeViewData])]
    }
    func ParseDictionary(levelDic : NSDictionary, dicName : String) -> [CITreeViewData] {
        let arrNodes : NSMutableArray = NSMutableArray()
        let rootKeys : NSArray = NSArray(array: levelDic.allKeys)
        for i in 0..<rootKeys.count {
            if levelDic.value(forKey: rootKeys[i] as! String) as? NSArray != nil {
                let files : NSArray = NSArray(array: levelDic.value(forKey: rootKeys[i] as! String) as! NSArray)
                var arrChilds : [CITreeViewData] = []
                for file in files {
                    arrChilds.append( CITreeViewData(name: file as! String))
                }
                let parent1 = CITreeViewData(name: rootKeys[i] as! String, children: arrChilds)
                arrNodes.add(parent1)
            } else {
                let anotherLevel : NSDictionary = NSDictionary(dictionary: levelDic.value(forKey: rootKeys[i] as! String) as! NSDictionary)
                let dicNewName : String = dicName + "." + String(describing: rootKeys[i])
                arrNodes.add(CITreeViewData(name: rootKeys[i] as! String, children: self.ParseDictionary(levelDic: anotherLevel, dicName: dicNewName)))
            }
        }
        return arrNodes as! [CITreeViewData]
    }
}
extension DocumentVC : CITreeViewDelegate {
    func treeViewNode(_ treeViewNode: CITreeViewNode, willExpandAt indexPath: IndexPath) {}
    
    func treeViewNode(_ treeViewNode: CITreeViewNode, didExpandAt indexPath: IndexPath) {}
    
    func treeViewNode(_ treeViewNode: CITreeViewNode, willCollapseAt indexPath: IndexPath) {}
    
    func treeViewNode(_ treeViewNode: CITreeViewNode, didCollapseAt indexPath: IndexPath) {
        print("Did Collapse")
    }
    
    func willExpandTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {}
    
    func didExpandTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        print("Did Expand")
    }
    
    func willCollapseTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {}
    
    func didCollapseTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {}
    func treeView(_ treeView: CITreeView, heightForRowAt indexPath: IndexPath, with treeViewNode: CITreeViewNode) -> CGFloat {
        return 60
        
    }
    
    func treeView(_ treeView: CITreeView, didSelectRowAt treeViewNode: CITreeViewNode, at indexPath: IndexPath) {
        print("Did Select Call")
        print(((arrFinal[indexPath.section] as! CITreeViewData).children[0] as! CITreeViewData).name)
    }
    
    func treeView(_ treeView: CITreeView, didDeselectRowAt treeViewNode: CITreeViewNode, at indexPath: IndexPath) {
        if let parentNode = treeViewNode.parentNode{
            print(parentNode.item)
        }
    }
}

extension DocumentVC : CITreeViewDataSource {
    func treeViewSelectedNodeChildren(for treeViewNodeItem: Any) -> [Any] {
        if let dataObj = treeViewNodeItem as? CITreeViewData {
            return dataObj.children
        }
        return []
    }
    
    func treeViewDataArray() -> [Any] {
        return data
    }
    func treeView(_ treeView: CITreeView, cellForRowAt indexPath: IndexPath, with treeViewNode: CITreeViewNode) -> UITableViewCell {
        let cell = treeView.dequeueReusableCell(withIdentifier: treeViewCellIdentifier) as! CITreeViewCell
        let dataObj = treeViewNode.item as! CITreeViewData
        cell.nameLabel.text = dataObj.name
        cell.setupCell(level: treeViewNode.level)
        return cell;
    }
    
}
//MARK:- SWRevealViewController Methods
extension DocumentVC : SWRevealViewControllerDelegate {
    // MARK: - Reveal View Controller Delagate Methods
    func revealController(_ revealController: SWRevealViewController, didMoveTo position: FrontViewPosition) {
        print(position)
        print("HomeVC")
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
    func revealController(_ revealController: SWRevealViewController, willMoveTo position: FrontViewPosition) {
        print(position)
        print("HomeVC")
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
}
