//
//  HomeViewController.swift
//  Demo
//
//  Created by etudiant on 20/11/2018.
//  Copyright © 2018 etudiant. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var clickStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "GES"
        // Do any additional setup after loading the view.
    }

    var clickTimer: Timer?
    
    @IBAction func startTimer(_ sender: Any) {
        self.clickTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            self.oneMoreClick()
        })
    }
  
    @IBAction func touchStepper(_ sender: UIStepper) {
        self.displayOnClickLabel()
    }
    
    private func oneMoreClick(){
        self.clickStepper.value += 1
        displayOnClickLabel()
    }
    
    private func displayOnClickLabel(){
        let val = Int(self.clickStepper.value)
        if val % 20 == 0{
            self.goToPictureController()
        }
        self.titleLabel.text = "\(val)"
    }
    
    @IBAction func stopTimer(){
        self.clickTimer?.invalidate()
        self.clickTimer = nil
    }
    
    @IBAction func Stop(_ sender: Any) {
        stopTimer()
        oneMoreClick()
    }
    
    private func goToPictureController(){
        let pictureController = PictureViewController()
        self.navigationController?.pushViewController(pictureController, animated: true)
    }
}
