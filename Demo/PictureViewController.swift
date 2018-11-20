import UIKit

class PictureViewController: UIViewController {

    @IBOutlet var helloTextField: UITextField!
    @IBOutlet var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.helloTextField.delegate = self
    }
    
    @IBAction func changeTextFieldVisibility(_ sender: UISwitch) {
        self.helloTextField.isEnabled = sender.isOn
    }
    
    @IBAction func changeOpacity(_ sender: UISlider) {
        self.backgroundImageView.alpha = CGFloat(sender.value)
    }
    
}

extension PictureViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.title = helloTextField.text
        helloTextField.text = ""
        return true
    }
}
