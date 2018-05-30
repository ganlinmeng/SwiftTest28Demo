//
//  MovieDetailsViewController.swift
//  swiftTest24_Spotit
//
//  Created by 李俊成 on 2018/5/21.
//  Copyright © 2018年 李俊成. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    var movieInfo : [String :String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    func setUpUI() {
        view.backgroundColor = UIColor.red
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
