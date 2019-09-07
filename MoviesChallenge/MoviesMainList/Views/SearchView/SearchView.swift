//
//  SearchView.swift
//  MoviesDlc
//
//  Created by Safa Ads on 7/18/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit

protocol SearchDelegate : NSObjectProtocol {
    func search(text:String)
    func clear()
}

class SearchView: UIView {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var contentView: UIView!
    let minSearchCount = 3
    weak  var delegate: SearchDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
        setSearchText()
    }

    func setView() {
        Bundle.main.loadNibNamed("SearchView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setSearchText() {
        searchTextField.delegate = self
    }
}

extension SearchView : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        if let searchText = searchTextField.text {
            if (searchText.count >= minSearchCount) {
                delegate?.search(text: searchText)
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchTextField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        if (updatedText.count == 0) {
            clearSearch()
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        clearSearch()
        return true
    }
    
    func clearSearch() {
        delegate?.clear()
    }
}
