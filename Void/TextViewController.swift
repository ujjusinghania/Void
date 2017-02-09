//
//  TextViewController.swift
//  Void
//
//  Created by Ujjwal Singhania on 2/2/17.
//  Copyright © 2017 Ujjwal Singhania. All rights reserved.
//

import UIKit

class TextViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    var flag: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        textView.delegate = self
        self.navigationController?.navigationBar.tintColor = UIColor.white;
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (flag == false) {
            textView.text = ""
            textView.textColor = UIColor.black
            flag = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
