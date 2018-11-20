import UIKit

class PictureViewController: UIViewController {

    @IBOutlet var helloTextField: UITextField!
    @IBOutlet var backgroundImageView: UIImageView!
    static let images: [String] = [
        "41trnBjzshL",
        "Unknown",
        "2"
    ]
    
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
    
    @IBAction func changeImage(_ sender: UISegmentedControl) {
        let str = PictureViewController.images[sender.selectedSegmentIndex]
        let img = UIImage(named: str)
        self.backgroundImageView.image = img
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
