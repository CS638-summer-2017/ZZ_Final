//
//  infoViewController.swift
//  final
//
//  Created by Lijie Zhao on 8/24/17.
//  Copyright © 2017 Lijie Zhao. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {
    var color: Color?
    var getColor: UIColor?
    
    @IBOutlet weak var textField: UITextView!
    
    @IBOutlet weak var bigVColor: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        bigVColor.backgroundColor = getColor
        textField.text = color?.formattedJSON
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
