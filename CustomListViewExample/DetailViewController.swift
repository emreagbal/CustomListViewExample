//
//  DetailViewController.swift
//  CustomListViewExample
//
//  Created by Emre Ağbal on 22.06.2020.
//  Copyright © 2020 Emre Ağbal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var collectionViewControllerDelegate : CollectionViewController?
    var cellView = CollectionViewModel.randomView(name: "temp",color: .black, height: 0)
    
    let colors : [String : UIColor] = ["Mor" : .purple, "Kırmızı" : .red, "Turuncu" : .systemOrange]

    // MARK: - UI Component Design
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 23)
        label.frame = CGRect(x: 0, y: 0, width: 390, height: 300)
        return label
    }()
    
    private let selectColorLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .opaqueSeparator
        label.textColor = .white
        label.frame = CGRect(x: 0, y: 300, width: 390, height: 20)
        label.text = "Renk değiştirmek için seçim yapınız"
        return label
    }()
    
    private let changePicker : UIPickerView = {
        let picker = UIPickerView()
        picker.frame = CGRect(x: 0, y: 320, width: 390, height: 50)
        picker.backgroundColor = .opaqueSeparator
        
        return picker
    }()
    
    private let detailText : UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 370, width: 390, height: 500)
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 13)
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ac malesuada ex. Donec non ex elementum, ullamcorper massa sed, fringilla dolor. Praesent eu gravida arcu, non auctor tortor. Morbi sem turpis, varius vel velit et, tristique scelerisque dui. Integer vel laoreet justo. Vestibulum cursus lorem sit amet mauris accumsan, id iaculis nunc rutrum. Aliquam ut odio eu diam egestas gravida ut a elit. Ut eu lacus lacus. Mauris non nisi lectus. Proin volutpat ligula erat, sed lobortis lectus vulputate sed. Nunc vitae metus nisi. Donec fringilla ex nulla, vitae iaculis quam mattis quis. Phasellus eu congue diam. Cras non magna non mi placerat pellentesque. Integer ac erat non tortor hendrerit luctus nec in velit. Suspendisse condimentum bibendum venenatis. Nulla facilisi. Nullam aliquam dui vel neque blandit pharetra. Suspendisse mollis euismod purus, sit amet pretium turpis. "
        return textView
    }()
    
    // MARK: - View Did Load Operations
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = cellView.name
        nameLabel.backgroundColor = cellView.color
        
        changePicker.delegate = self
        changePicker.dataSource = self
        
        view.addSubview(nameLabel)
        view.addSubview(selectColorLabel)
        view.addSubview(changePicker)
        view.addSubview(detailText)
        
        
    }

}
    // MARK: - Picker View Implementation
extension DetailViewController :  UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(colors.keys)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var currentViews = self.collectionViewControllerDelegate!.collectionViews
        for i in 0 ... currentViews.count - 1 {
            if(currentViews[i].color == self.cellView.color ){
                currentViews[i].color = Array(colors.values)[row]
                currentViews[i].name  = Array(colors.keys)[row]
            }
        }
        self.collectionViewControllerDelegate?.collectionViews = currentViews
    }
    
}
