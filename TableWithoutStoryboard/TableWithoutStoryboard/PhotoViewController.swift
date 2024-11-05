//
//  PhotoViewController.swift
//  TableWithoutStoryboard
//
//  Created by Mayya Bykhanova on 01.11.2024.
//

import Foundation
import UIKit
import SnapKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let imageView = UIImageView()
    private let addPhotoButton = UIButton()
    private let deletePhotoButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraits()
        
        //        if let image = selectedImage {
        //            imageView.image = image
        //        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
        view.addSubview(imageView)
        
        addPhotoButton.setTitle("Add Photo", for: .normal)
        addPhotoButton.setTitleColor(.systemBlue, for: .normal)
        addPhotoButton.addTarget(self, action: #selector(addPhotoTapped), for: .touchUpInside)
        view.addSubview(addPhotoButton)
        
        deletePhotoButton.setTitle("Delete Photo", for: .normal)
        deletePhotoButton.setTitleColor(.systemRed, for: .normal)
        deletePhotoButton.addTarget(self, action: #selector(deletePhotoTapped), for: .touchUpInside)
        view.addSubview(deletePhotoButton)
        
    }
    
    private func setupConstraits() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        addPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(150)
            make.height.equalTo(44)
        }
        
        deletePhotoButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(150)
            make.height.equalTo(44)
        }
    }
    
    @objc private func addPhotoTapped() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    @objc private func deletePhotoTapped() {
        imageView.image = nil
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
                                                                                                                
}
    
    
    

