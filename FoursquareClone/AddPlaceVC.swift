//
//  AddPlaceVC.swift
//  FoursquareClone
//
//  Created by Damla KS on 19.06.2023.
//

import UIKit

class AddPlaceVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var pNameText: UITextField!
    @IBOutlet weak var pTypeText: UITextField!
    @IBOutlet weak var pAtmosphereText: UITextField!
    @IBOutlet weak var pImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clickedImage()
    }

    @IBAction func nextButtonClicked(_ sender: Any) {
        if pNameText.text != "" && pTypeText.text != "" && pAtmosphereText.text != "" {
            if let choosenImage = pImageView.image {
                let placeModel = PlaceModel.sharedInstance
                placeModel.placeName = pNameText.text!
                placeModel.placeType = pTypeText.text!
                placeModel.placeAtmosphere = pAtmosphereText.text!
                placeModel.placeImage = choosenImage
            }
            performSegue(withIdentifier: "toMapVC", sender: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Place name/type/atmosphere ?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okButton)
            self.present(alert, animated: true)
        }
    }
    
    func clickedImage() {
        pImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        pImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func chooseImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        pImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
}
