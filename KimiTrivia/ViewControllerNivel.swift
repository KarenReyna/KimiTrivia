//
//  ViewControllerNivel.swift
//  KimiTrivia
//
//  Created by lizbeth garza walle on 18/03/16.
//  Copyright © 2016 Ana Karen Reyna. All rights reserved.
//

import UIKit

class ViewControllerNivel: UIViewController {

    @IBOutlet weak var lblNivel: UILabel!
    var titulo: String = "aaa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNivel.text = titulo

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
}
