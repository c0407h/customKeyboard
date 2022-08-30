
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customTextField: UITextField!
    @IBOutlet weak var emoticonTextField: UITextField!
    @IBOutlet weak var bottomAnchor: NSLayoutConstraint!
    
    var emoticonKeyboard: CustomKeyboard?
    var kbHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @IBAction func emoticonbtn(_ sender: UIButton) {
         self.emoticonKeyboard = CustomKeyboard(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.kbHeight ?? 275))
         self.emoticonTextField.inputView = self.emoticonKeyboard
         self.emoticonTextField.becomeFirstResponder()
    }
    
    @IBAction func bgTap(_ sender: Any) {
        self.bottomAnchor.constant = 0
        self.customTextField.resignFirstResponder()
        self.emoticonTextField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
            self.kbHeight = keyboardHeight
            self.bottomAnchor.constant = -keyboardHeight
        }
    }

}

