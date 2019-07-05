import UIKit


class TestViewController: UIViewController {
    
    @IBOutlet weak var img_view: UIImageView!
    let imagepicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btn_pick_img_press(_ sender: Any) {
        imagepicker.delegate = self
        imagepicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        self.present(imagepicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            img_view.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}

extension TestViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
}
