//
//  DocumentVC.swift
//  Promise
//
//  Created by Captain on 15/09/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit
import QuickLook
class DocumentVC: UIViewController {
    //MARK:-
    @IBOutlet weak var sampleTreeView: CITreeView!
    //MARK:- Variable
    var data : [CITreeViewData] = []
    let treeViewCellIdentifier = "TreeViewCellIdentifier"
    let treeViewCellNibName = "CITreeViewCell"
    var Home_Barbutton: UIBarButtonItem!
    var arrFinal : NSMutableArray = NSMutableArray()
    public var docViewController = QLPreviewController()
    public var arrDocuments = [NSURL]()
    //MARK:- Life Cycle
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
        self.arrDocuments = []
        self.docViewController = QLPreviewController()
        self.docViewController.dataSource = self
        self.docViewController.reloadData()
        sampleTreeView.register(UINib(nibName: treeViewCellNibName, bundle: nil), forCellReuseIdentifier: treeViewCellIdentifier)
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
        if sender.tag == 1 {
            sampleTreeView.expandAllRows()
        }else {
            sampleTreeView.collapseAllRows()
        }
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
        sampleTreeView.expandAllRows()
        sampleTreeView.reloadDataWithoutChangingRowStates()
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
    func storeAndShare(withURLString: String) {
        guard let url = URL(string: withURLString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let tmpURL = FileManager.default.temporaryDirectory
                .appendingPathComponent(response?.suggestedFilename ?? "fileName.png")
            do {
                try data.write(to: tmpURL)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self.arrDocuments = [tmpURL as! NSURL]
                self.docViewController.reloadData()
                self.present(self.docViewController, animated: true, completion: nil)
            }
        }.resume()
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
        print("Did Select Call")
        if ((treeViewNode.item as! CITreeViewData).name).contains(".xlsx") || ((treeViewNode.item as! CITreeViewData).name).contains(".pdf") || ((treeViewNode.item as! CITreeViewData).name).contains(".png") {
            print(((treeViewNode.item as! CITreeViewData).name))
            self.storeAndShare(withURLString: ((treeViewNode.item as! CITreeViewData).name).replacingOccurrences(of: ":8000", with: ""))
        }
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
        if ((treeViewNode.item as! CITreeViewData).name).contains(".xlsx") || ((treeViewNode.item as! CITreeViewData).name).contains(".pdf") {
           cell.nameLabel.text = (dataObj.name as NSString).lastPathComponent
        }else {
         cell.nameLabel.text = dataObj.name
        }
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
extension DocumentVC : QLPreviewControllerDataSource {
 func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    //MARK: Document Viewer Delegate methods
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return self.arrDocuments.count
    }
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return self.arrDocuments[index] as QLPreviewItem
    }
}
