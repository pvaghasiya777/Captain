import Foundation
import UIKit
import QuartzCore
var kPasswordlength = 6
var kPhoneNumberRegx = "^+(?:[0-9] ?){6,14}[0-9]$"
var kEmailAddressRegx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
var kPostalcodeRegxCanada = "(^[a-zA-Z][0-9][a-zA-Z][- ]*[0-9][a-zA-Z][0-9]$)"
var PASSWORD_PATTERN = "^(?=.*[0-9])(?=.*[A-Z])(?=.*[@#$%^&+=]).{4,}$"
var kPhoneNumberRegx_speeddial = "^+(?:[0-9] ?){6,14}[0-9]$"

extension UIImage {
    func detectOrientationDegree () -> CGFloat {
        switch imageOrientation {
        case .right, .rightMirrored:    return 90
        case .left, .leftMirrored:      return -90
        case .up, .upMirrored:          return 180
        case .down, .downMirrored:      return 0
        @unknown default:
            return 0
        }
    }
    func resizeImageWith(newSize: CGSize) -> UIImage {
        let horizontalRatio = newSize.width / size.width
        let verticalRatio = newSize.height / size.height
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    func resize(withWidth newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
extension URL
{
    var attributes: [FileAttributeKey : Any]? {
        do {
            return try FileManager.default.attributesOfItem(atPath: path)
        } catch let error as NSError {
            print("FileAttribute error: \(error)")
        }
        return nil
    }

    var fileSize: UInt64 {
        return attributes?[.size] as? UInt64 ?? UInt64(0)
    }

    var fileSizeString: String {
        return ByteCountFormatter.string(fromByteCount: Int64(fileSize), countStyle: .file)
    }

    var creationDate: Date? {
        return attributes?[.creationDate] as? Date
    }
}
extension Data {
    var string: String? { return String(data: self, encoding: .utf8) }
}
extension Collection where Element: Numeric {
    /// Returns the sum of all elements in the collection
    func sum() -> Element { return reduce(0, +) }
}

extension UIDevice {
    class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    class var isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == .tv
    }
    class var isCarPlay: Bool {
        return UIDevice.current.userInterfaceIdiom == .carPlay
    }
}
extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    func animateButtonDown() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseIn], animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: nil)
    }
    func animateButtonUp() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    func set_bottom_border_view(height : Float, color : UIColor)
    {
        let border = CALayer()
        let width = CGFloat(height)
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    func setborder(bordercolor : UIColor , borderwidth : CGFloat) {
        self.layer.borderColor = bordercolor.cgColor
        self.layer.borderWidth = borderwidth
        self.layer.masksToBounds = true
    }
    func Setbottomborderofview(frame : CGRect , bordercolor : UIColor) {
        let bottomlayer : CALayer = CALayer()
        bottomlayer.frame = frame
        bottomlayer.backgroundColor = bordercolor.cgColor
        self.layer.addSublayer(bottomlayer)
    }
    func setcornerRadius(cornerradius : CGFloat) {
        self.layer.cornerRadius = cornerradius
        self.layer.masksToBounds = true
    }
    
    func make_Circle() {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.masksToBounds = true
    }
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
extension UIColor {
    convenience init(hex: UInt32) {
        let mask = 0x000000FF
        let r = Int(hex >> 16) & mask
        let g = Int(hex >> 8) & mask
        let b = Int(hex) & mask
        let red   = CGFloat(r) / 255
        let green = CGFloat(g) / 255
        let blue  = CGFloat(b) / 255
        self.init(red:red, green:green, blue:blue, alpha:1)
    }

    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
extension String
{
    public var trimmed: String {
        return String(self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
    }
    var isValidEmailAddress : Bool {
        let emailRegex = kEmailAddressRegx
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    var isValidPhoneNumber : Bool {
        let phoneRegex = kPhoneNumberRegx
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    var isValidString : Bool {
        if(self.count == 0) {
            return false
        }
        return true
    }
    var isPwdLenth : Bool {
        if self.count >= kPasswordlength {
             return true
        } else {
             return false
        }
    }
    var isPasswordValid : Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,15}")
        return passwordTest.evaluate(with: self)
    }
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
    var containEmoji: Bool {
        // http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x3030, 0x00AE, 0x00A9, // Special Characters
            0x1D000...0x1F77F, // Emoticons
            0x2100...0x27BF, // Misc symbols and Dingbats
            0xFE00...0xFE0F, // Variation Selectors
            0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
                return true
            default:
                continue
            }
        }
        return false
    }

    var length: Int {
        get {
            return self.count
        }
    }
    var firstCharacter: String? {
        return Array(self).map({String($0)}).first
    }
    var hasLetters: Bool {
        return (rangeOfCharacter(from: NSCharacterSet.letters, options: .numeric, range: nil) != nil)
    }
    var hasNumbers: Bool {
        return (rangeOfCharacter(from: NSCharacterSet.decimalDigits, options: .literal, range: nil) != nil)
    }
    var isAlphabetic: Bool {
        return  hasLetters && !hasNumbers
    }
    var isNumeric: Bool {
        return  !hasLetters && hasNumbers
    }
    var lastCharacter: String? {
        guard let last = Array(self).map({String($0)}).last else {
            return nil
        }
        return String(last)
    }
    var lines: [String] {
        var result:[String] = []
        enumerateLines { (line, stop) -> () in
            result.append(line)
        }
        return result
    }
    var Remove_single_double_quotes_InString : String {
        var resultstr = self.replacingOccurrences(of: "'", with: "")
        resultstr = resultstr.replacingOccurrences(of: "\"", with: "")
        return resultstr
    }
    var RemoveSpacesInString : String {
        var resultstr = self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) as NSString
        resultstr = resultstr.replacingOccurrences(of: " ", with: "") as NSString
        return resultstr as String
    }
    var data: Data {
        return Data(utf8)
    }
    var base64Encoded: Data {
        return data.base64EncodedData()
    }
    var base64Decoded: Data? {
        return Data(base64Encoded: self)
    }
    func LocalTimeZoneToServerTimeZone(LocalTimeZone : NSTimeZone, ServerTimeZone : NSTimeZone, date : String , time : String , formatter : String) -> String
    {
        let date = date
        let time = time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let date_time_string = date + " " + time
        let date_str = dateFormatter.date(from: date_time_string)
        let timeZone1 = ServerTimeZone
        let localTimeZone = LocalTimeZone
        let timeZone1Interval = timeZone1.secondsFromGMT(for: date_str!)
        let deviceTimeZoneInterval = localTimeZone.secondsFromGMT(for: date_str!)
        let timeInterval =  Double(timeZone1Interval - deviceTimeZoneInterval)
        let originalDate =  Date(timeInterval: timeInterval , since: date_str!)
        let dateFormater : DateFormatter = DateFormatter()
        dateFormater.dateFormat = formatter
        return dateFormater.string(from: originalDate)
    }
    func LocalTimeZoneToServerTimeZone_order(LocalTimeZone : NSTimeZone, ServerTimeZone : NSTimeZone, date : String , time : String , formatter : String) -> String
    {
        let date = date
        let time = time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        var date_time_string : String = String()

        if time == "" && date.length > 0
        {
            dateFormatter.dateFormat = formatter
            date_time_string = date
        }
        else if date == "" && time.length > 0
        {
            dateFormatter.dateFormat = formatter
            date_time_string = time
        }
        else if date.length > 0 && time.length > 0
        {
            dateFormatter.dateFormat = formatter
            date_time_string = date + " " + time
        }
        else
        {
            date_time_string = ""
        }

        if date.length == 0 && time.length == 0
        {
            return ""
        }
        else
        {
            let date_str = dateFormatter.date(from: date_time_string)
            let timeZone1 = ServerTimeZone
            let localTimeZone = LocalTimeZone
            let timeZone1Interval = timeZone1.secondsFromGMT(for: date_str!)
            let deviceTimeZoneInterval = localTimeZone.secondsFromGMT(for: date_str!)

            let timeInterval =  Double(timeZone1Interval - deviceTimeZoneInterval)

            let originalDate =  Date(timeInterval: timeInterval , since: date_str!)
            let dateFormater : DateFormatter = DateFormatter()
            dateFormater.dateFormat = formatter
            return dateFormater.string(from: originalDate)
        }
    }
    func date(with Format :String)-> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = Format as String
        return formatter.date(from: self)!
    }
    func date_of_appformat()-> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = Config.App_Date_Format
        return formatter.date(from: self)!
    }
    func dateFrom(fromFormat :String, toFormat : String)-> String {
        let formatter = DateFormatter()
        formatter.dateFormat = fromFormat
        return formatter.date(from: self)!.string(with: toFormat)
    }
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
    func between(_ left: String, _ right: String) -> String? {
        guard
            let leftRange = range(of: left), let rightRange = range(of: right, options: .backwards)
            , leftRange.upperBound <= rightRange.lowerBound
            else { return nil }

        let sub = self[leftRange.upperBound...]
        let closestToLeftRange = sub.range(of: right)!
        return String(sub[..<closestToLeftRange.lowerBound])
    }
    func substring(from : Int) -> String {
        if (from < 0 || from > self.count) {
            print("index \(from) out of bounds")
            return self
        }
        let fromIndex = self.index(self.startIndex, offsetBy: from)
        return String(self[fromIndex...])
    }
    func substring(to : Int) -> String {
        if (to < 0 || to >= self.count) {
            print("index \(to) out of bounds")
            return self
        }
        let toIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[...toIndex])
    }
    func substring(_ r: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
        let toIndex = self.index(self.startIndex, offsetBy: r.upperBound)
        let indexRange = Range<String.Index>(uncheckedBounds: (lower: fromIndex, upper: toIndex))
        return String(self[indexRange])
    }
    func character(_ at: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: at)]
    }

    /// SwifterSwift: Bold string.
    var bold: NSAttributedString
    {
        return NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    /// SwifterSwift: Underlined string
    var underline: NSAttributedString {
        return NSAttributedString(string: self, attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    /// SwifterSwift: Strikethrough string.
    var strikethrough: NSAttributedString
    {
        return NSAttributedString(string: self, attributes: [NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue as Int])
    }
    /// SwifterSwift: Italic string.
    var italic: NSAttributedString
    {
        return NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    var condenseWhitespace:String{
        return  self.replacingOccurrences(of: " ", with: "")
    }
    /// SwifterSwift: Add color to string.
    /// - Parameter color: text color.
    /// - Returns: a NSAttributedString versions of string colored with given color.
    func colored(with color: UIColor) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    func capitalizingFirstLetter() -> String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

    func twodecimalfloatstring() -> String {
        return String(format: "%.2f",self)
    }
    func range(from nsRange: NSRange) -> Range<String.Index>?
    {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location + nsRange.length, limitedBy: utf16.endIndex),
            let from = from16.samePosition(in: self),
            let to = to16.samePosition(in: self)
            else { return nil }
        return from ..< to
    }
}
extension Date
{
    func string(with format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    func string_with_app_format() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Config.App_Date_Format
        return dateFormatter.string(from: self)
    }
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    func getThisMonthEnd() -> Date? {
        let components:NSDateComponents = Calendar.current.dateComponents([.year, .month], from: self) as NSDateComponents
        components.month += 1
        components.day = 1
        components.day -= 1
        return Calendar.current.date(from: components as DateComponents)!
    }
    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    func get_today_date() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = Config.App_Date_Format
        let final_date : NSString = formatter.string(from: date) as NSString
        return final_date as String
    }
    func get_current_time() -> NSString
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ssa"
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        let final_time : NSString = formatter.string(from: date) as NSString
        return final_time
    }

}
extension UIBarButtonItem
{
    func addTargetForAction(target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
    func style(tint color: UIColor, font f: UIFont? = nil) {
        let font = f ?? UIFont.systemFont(ofSize: UIFont.systemFontSize)
        tintColor = color
        let atts = [
            NSAttributedString.Key.font : font,
            NSAttributedString.Key.foregroundColor : color
        ]
        setTitleTextAttributes(atts, for: .normal)
    }
}
extension UIButton {
    func setimage_tintColor(image : UIImage, color : UIColor) {

        self.setImage(image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
        self.tintColor = color
    }
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        let writingDirection = UIApplication.shared.userInterfaceLayoutDirection
        let factor: CGFloat = writingDirection == .leftToRight ? 1 : -1
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount*factor, bottom: 0, right: insetAmount*factor)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount*factor, bottom: 0, right: -insetAmount*factor)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    func centerTextAndImage(spacing: CGFloat , direction : NSWritingDirection) {
        let insetAmount = spacing / 2
        let factor: CGFloat = direction == .leftToRight ? 1 : -1
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount*factor, bottom: 0, right: insetAmount*factor)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount*factor, bottom: 0, right: -insetAmount*factor)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    func alignTextUnderImage() {
        guard let imageView = imageView else {
            return
        }
        self.contentVerticalAlignment = .top
        self.contentHorizontalAlignment = .center
        let imageLeftOffset = (self.bounds.width - imageView.bounds.width) / 2//put image in center
        let titleTopOffset = imageView.bounds.height + 5
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: imageLeftOffset, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: titleTopOffset, left: -imageView.bounds.width, bottom: 0, right: 0)
    }

    func alignImageAndTitleVertically(padding: CGFloat = 6.0) {
        let imageSize: CGSize = imageView!.image!.size
        titleEdgeInsets = UIEdgeInsets(top: 0.0, left: -imageSize.width, bottom: -(imageSize.height + padding), right: 0.0)
        let labelString = NSString(string: titleLabel!.text!)
        let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: titleLabel!.font!])
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + padding), left: 0.0, bottom: 0.0, right: -titleSize.width)
        let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0;
        self.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0.0, bottom: edgeOffset, right: 0.0)
    }
}
extension UIImageView {
    func setimage_tintColor(color : UIColor) {
        self.image = self.image!.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}
extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
extension UITableView {
    func TableViewRegisterNib(nibName: String,Identifier : String) {
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: Identifier)
    }
    func ShowNodataView(msg : String) {
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        noDataLabel.text          = msg
        noDataLabel.textColor     = UIColor.black
        noDataLabel.textAlignment = .center
        self.backgroundView  = noDataLabel
    }
}
extension UIView {
    var allSubViews : [UIView] {
        var array = [self.subviews].flatMap {$0}
        array.forEach { array.append(contentsOf: $0.allSubViews) }
        return array
    }
    func screenshot_of_view() -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension UIViewController
{
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    var appDelegate:AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func presentAlertWithTitle(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }

}
extension UITextField {
    
    enum PaddingSide {
        case left(CGFloat)
        case right(CGFloat)
        case both(CGFloat)
    }
    
    func addPadding(_ padding: PaddingSide) {
        
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        
        switch padding {
            
        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.leftView = paddingView
            self.rightViewMode = .always
            
        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            self.rightView = paddingView
            self.rightViewMode = .always
            
        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: self.frame.height))
            // left
            self.leftView = paddingView
            self.leftViewMode = .always
            // right
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }
}

extension UITextField {

enum Direction {
    case Left
    case Right
}

// add image to textfield
func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor){
    let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    mainView.layer.cornerRadius = 5

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    view.backgroundColor = .white
    view.clipsToBounds = true
    view.layer.cornerRadius = 5
    view.layer.borderWidth = CGFloat(0.5)
    view.layer.borderColor = colorBorder.cgColor
    mainView.addSubview(view)

    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: 8.0, y: 8.0, width: 24.0, height: 24.0)
    view.addSubview(imageView)

    let seperatorView = UIView()
    seperatorView.backgroundColor = colorSeparator
    mainView.addSubview(seperatorView)

    if(Direction.Left == direction){ // image left
        seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
        self.leftViewMode = .always
        self.leftView = mainView
    } else { // image right
        seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
        self.rightViewMode = .always
        self.rightView = mainView
    }

    self.layer.borderColor = colorBorder.cgColor
    self.layer.borderWidth = CGFloat(0.5)
    self.layer.cornerRadius = 5
}

}
extension UITextField
{
    func rangeFromTextRange(textRange:UITextRange) -> NSRange {
        let location:Int = self.offset(from: self.beginningOfDocument, to: textRange.start)
        let length:Int = self.offset(from: textRange.start, to: textRange.end)
        return NSMakeRange(location, length)
    }
    func set_Image_on_LeftView_of_Textfield(imagename : String, width : CGFloat, height : CGFloat)
    {
        self.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let image = UIImage(named: imagename)
        imageView.image = image
        imageView.contentMode = .center
        self.leftView = imageView
    }
    func set_Image_on_RightView_of_Textfield(imagename : String, width : CGFloat, height : CGFloat)
    {
        self.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let image = UIImage(named: imagename)
        imageView.image = image
        imageView.contentMode = .center
        self.rightView = imageView
    }
}
extension Locale
{
    static var preferredLanguage: String {
        get {
            return self.preferredLanguages.first ?? "en"
        }
        set {
            UserDefaults.standard.set([newValue], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
    }
}
extension UITableViewCell
{
    func shake(duration: CFTimeInterval = 0.3, pathLength: CGFloat = 15) {
        let position: CGPoint = self.center
        let path: UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: position.x, y: position.y))
        path.addLine(to: CGPoint(x: position.x-pathLength, y: position.y))
        path.addLine(to:  CGPoint(x: position.x+pathLength, y: position.y))
        path.addLine(to: CGPoint(x: position.x-pathLength, y: position.y))
        path.addLine(to: CGPoint(x: position.x+pathLength, y: position.y))
        path.addLine(to: CGPoint(x: position.x, y: position.y))
        let positionAnimation = CAKeyframeAnimation(keyPath: "position")
        positionAnimation.path = path.cgPath
        positionAnimation.duration = duration
        positionAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        CATransaction.begin()
        self.layer.add(positionAnimation, forKey: nil)
        CATransaction.commit()
    }
}
extension Array {
    /// Returns an array containing this sequence shuffled
    var shuffled: Array {
        var elements = self
        return elements.shuffle()
    }
    /// Shuffles this sequence in place
    @discardableResult
    mutating func shuffle() -> Array {
        let count = self.count
        indices.lazy.dropLast().forEach {
            swapAt($0, Int(arc4random_uniform(UInt32(count - $0))) + $0)
        }
        return self
    }
    var chooseOne: Element { return self[Int(arc4random_uniform(UInt32(count)))] }
    func choose(_ n: Int) -> Array { return Array(shuffled.prefix(n)) }
}
struct ImageStore {
    static func delete(imageNamed name: String) {
        guard let imagePath = ImageStore.path(for: name) else {
            return
        }
        try? FileManager.default.removeItem(at: imagePath)
    }
    static func retrieve(imageNamed name: String) -> UIImage? {
        guard let imagePath = ImageStore.path(for: name) else {
            return nil
        }
        return UIImage(contentsOfFile: imagePath.path)
    }
    static func store(image: UIImage, name: String) throws {
        guard let imageData = image.pngData() else {
            throw NSError(domain: "com.thecodedself.imagestore", code: 0, userInfo: [NSLocalizedDescriptionKey: "The image could not be created"])
        }
        guard let imagePath = ImageStore.path(for: name) else {
            throw NSError(domain: "com.thecodedself.imagestore", code: 0, userInfo: [NSLocalizedDescriptionKey: "The image path could not be retrieved"])
        }
        try imageData.write(to: imagePath)
    }
    private static func path(for imageName: String, fileExtension: String = "png") -> URL? {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return directory?.appendingPathComponent("\(imageName).\(fileExtension)")
    }
}
struct Env {
    private static let production : Bool = {
        #if DEBUG
            print("DEBUG")
            return false
        #elseif ADHOC
            print("ADHOC")
            return false
        #else
            print("PRODUCTION")
            return true
        #endif
    }()
    static func isProduction () -> Bool {
        return self.production
    }
}
struct Platform
{
    static let isSimulator: Bool = {
        #if arch(i386) || arch(x86_64)
            return true
        #endif
        return false
    }()
}
class PaddingLabel_New: UILabel {
    //USE Label
//    label.padding(2, 2, 5, 5)
    var insets = UIEdgeInsets.zero
    
    /// Добавляет отступы
    func padding(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}
@IBDesignable class PaddingLabel: UILabel {
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}
@IBDesignable class GradientView1: UIView
{
    @IBInspectable var topColor: UIColor = UIColor.white
    @IBInspectable var bottomColor: UIColor = UIColor.black
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }
}
class TableViewHelper
{
    class func EmptyMessage(message:String, tableview:UITableView , textColor : UIColor)
    {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableview.bounds.size.width, height: tableview.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = textColor
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        tableview.backgroundView = messageLabel;
        tableview.separatorStyle = .none
    }
}
class Helper: NSObject
{
    class func callToNumber(number:String ,Viewcontroller : UIViewController)
    {
        if (number.length == 0) {
            return
        }
        let num = number.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: " ", with: "")
        let phone = "tel://\(num)"
        let url = URL(string:phone)!
        let shared = UIApplication.shared
        if (shared.canOpenURL(url)) {
            shared.open(url, options: [ : ], completionHandler: nil)
        } else {
            Viewcontroller.alert(message: "Error", title: "Call facility is not available on your device.!!!")
        }
    }
}
class TextfieldHelper : NSObject {
    class func SetCursorToBeginning(textField:UITextField)  // To the beginning
    {
        let newPosition = textField.beginningOfDocument
        textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
    }
    class func SetCursorToEnd(textField:UITextField)  // To the end
    {
        let newPosition = textField.endOfDocument
        textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
    }
    class func setCursorPosition(input: UITextField, position: Int)
    {
        if let newPosition = input.position(from: input.beginningOfDocument, offset: position) {
            input.selectedTextRange = input.textRange(from: newPosition, to: newPosition)
        }
    }
}
