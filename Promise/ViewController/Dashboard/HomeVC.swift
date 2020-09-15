
import UIKit
import ABGaugeViewKit
class HomeVC: UIViewController
{
    //MARK:- IBOutlet
    @IBOutlet var View_TotalPiece: UIView!
    @IBOutlet var View_TotalWeight: UIView!
    @IBOutlet var menu_Barbutton: UIBarButtonItem!
    @IBOutlet var Select_segment: UISegmentedControl!
    @IBOutlet var Gauge_Released_weight: ABGaugeView!
    @IBOutlet var Gauge_Released_Pieces: ABGaugeView!
    @IBOutlet var Gauge_Shipping_weight: ABGaugeView!
    @IBOutlet var Gauge_Shipping_Pieces: ABGaugeView!
    @IBOutlet var lbl_shipping_Weight: UILabel!
    @IBOutlet var lbl_Shipping_Weight_Height: NSLayoutConstraint!
    @IBOutlet var lbl_Shipping_Pieces: UILabel!
    @IBOutlet var lbl_Shipping_Pieces_Height: NSLayoutConstraint!
    @IBOutlet var lbl_Released_Pieces_Height: NSLayoutConstraint!
    @IBOutlet var lbl_Released_Weight: UILabel!
    @IBOutlet var lbl_Released_Weight_Height: NSLayoutConstraint!
    @IBOutlet var lbl_Released_Pieces: UILabel!
    //MARK:- Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.Initialization()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.title = ""
        self.revealViewController()?.delegate = nil
    }
    //MARK:- Initialization
    func Initialization() {
        if revealViewController() != nil {
            self.revealViewController().delegate = self
            menu_Barbutton.target = self.revealViewController()
            menu_Barbutton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController()?.rearViewRevealWidth = 280
        }
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        if UIDevice.isPad == true {
            self.lbl_shipping_Weight.font = lbl_shipping_Weight.font.withSize(25)
            self.lbl_Shipping_Weight_Height.constant = 25
            
            self.lbl_Released_Weight.font = lbl_shipping_Weight.font.withSize(25)
            self.lbl_Released_Weight_Height.constant = 25
            
            self.lbl_Released_Pieces.font = lbl_shipping_Weight.font.withSize(25)
            self.lbl_Released_Pieces_Height.constant = 25
            
            self.lbl_Shipping_Pieces.font = lbl_shipping_Weight.font.withSize(25)
            self.lbl_Shipping_Pieces_Height.constant = 25
        }
        self.Design()
    }
    func Design() {
        Utils.Set_Same_Corner_Radius(views: [View_TotalPiece,View_TotalWeight], cornerRadius: 10)
        Select_segment.setTitleTextAttributes( [NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
           return .portrait
    }

    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
           return .portrait
    }
}
//MARK:- SWRevealViewController Methods
extension HomeVC : SWRevealViewControllerDelegate {
    // MARK: - Reveal View Controller Delagate Methods
    func revealController(_ revealController: SWRevealViewController, didMoveTo position: FrontViewPosition) {
        print(position)
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
    func revealController(_ revealController: SWRevealViewController, willMoveTo position: FrontViewPosition) {
        print(position)
        Utils.Disable_Front_ViewController(viewController: self, position: position)
    }
}
