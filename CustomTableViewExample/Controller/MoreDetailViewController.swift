//
//  MoreDetailViewController.swift
//  Soccer
//
//  Created by mac on 2/29/24.
//

import Foundation
import UIKit

class MoreDetailViewController: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var moreView: UIView!
    @IBOutlet weak var webSite: UIButton!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var appearance_label: UILabel!
    @IBOutlet weak var goals_label: UILabel!
    @IBOutlet weak var assist_label: UILabel!
    @IBOutlet weak var red_label: UILabel!
    @IBOutlet weak var yellow_label: UILabel!
    @IBOutlet weak var age_label: UILabel!
    @IBOutlet weak var nationality_label: UILabel!
    @IBOutlet weak var position_label: UILabel!
    @IBOutlet weak var trophy_label: UILabel!
    @IBOutlet weak var appearance: UILabel!
    @IBOutlet weak var goals: UILabel!
    @IBOutlet weak var assist: UILabel!
    @IBOutlet weak var red: UILabel!
    @IBOutlet weak var yellow: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var nationality: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var trophy: UILabel!
    
    override func viewDidLoad() {
        setBackgroundImage()
        backBtn.setTitle("", for: .normal)
        setupMoreView()
        setWebBtn()
        setupPhoto()
        setupMoreInfo()
    }
    
    func setupMoreInfo() {
        appearance.text = "xxx"
        goals.text      = "xxx"
        assist.text     = "xxx"
        red.text        = "xxx"
        yellow.text     = "xxx"
        age.text        = "\(ViewController.sectionData[Players.section].players[Players.selected].age)"
        let country = ViewController.sectionData[Players.section].players[Players.selected].nationality.split(separator: "_")[1]
        switch country {
        case "AR":
            nationality.text = "Argentina"
            break
        case "AUT":
            nationality.text = "Austria"
            break
        case "BE":
            nationality.text = "Belgium"
            break
        case "BRA":
            nationality.text = "Brazil"
            break
        case "DE":
            nationality.text = "Germany"
            break
        case "ENG":
            nationality.text = "England"
            break
        case "ESP":
            nationality.text = "Spain"
            break
        case "FR":
            nationality.text = "France"
            break
        case "HR":
            nationality.text = "Croatia"
            break
        case "TR":
            nationality.text = "Turkey"
            break
        case "UA":
            nationality.text = "Ukraine"
            break
        case "UY":
            nationality.text = "Uruguai"
            break
        default:
            break
        }
        switch ViewController.sectionData[Players.section].players[Players.selected].position {
        case "G":
            position.text = "Goalkeeper"
            break
        case "M":
            position.text = "Midfielder"
            break
        case "D":
            position.text = "Defender"
            break
        case "F":
            position.text = "Forward"
        default:
            break
        }
        trophy.text     = "xxx"
        
        if Players.isDarkMode {
            appearance_label.textColor  = .white
            goals_label.textColor       = .white
            assist_label.textColor      = .white
            red_label.textColor         = .white
            yellow_label.textColor      = .white
            age_label.textColor         = .white
            nationality_label.textColor = .white
            position_label.textColor    = .white
            trophy_label.textColor      = .white
            appearance.textColor        = .white
            goals.textColor             = .white
            assist.textColor            = .white
            red.textColor               = .white
            yellow.textColor            = .white
            age.textColor               = .white
            nationality.textColor       = .white
            position.textColor          = .white
            trophy.textColor            = .white
        } else {
            appearance_label.textColor  = .black
            goals_label.textColor       = .black
            assist_label.textColor      = .black
            red_label.textColor         = .black
            yellow_label.textColor      = .black
            age_label.textColor         = .black
            nationality_label.textColor = .black
            position_label.textColor    = .black
            trophy_label.textColor      = .black
            appearance.textColor        = .black
            goals.textColor             = .black
            assist.textColor            = .black
            red.textColor               = .black
            yellow.textColor            = .black
            age.textColor               = .black
            nationality.textColor       = .black
            position.textColor          = .black
            trophy.textColor            = .black
        }
    }
    
    func setupPhoto() {
        photo.layer.cornerRadius = 50.0
        photo.layer.borderWidth = 2.0
        
        photo.layer.borderColor = Players.isDarkMode ?  UIColor.white.cgColor : UIColor.darkGray.cgColor
        
        DispatchQueue.global().async {
            guard let url = URL(string: ViewController.sectionData[Players.section].players[Players.selected].photos[0]) else {
                DispatchQueue.main.async {
                    
                }
                return
            }
            
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async { [self] in
                    photo.image = image
                }
            } else {
                DispatchQueue.main.async {
                    
                }
            }
        }
    }
    
    func setupMoreView() {
        moreView.layer.cornerRadius = 20.0
        moreView.layer.masksToBounds = true
        
        if Players.isDarkMode {
            moreView.backgroundColor = .darkGray
        } else {
            moreView.backgroundColor = .white
        }
    }
    
    func setWebBtn() {
        webSite.setTitle("Website", for: .normal)
        webSite.layer.cornerRadius = 10.0
        webSite.layer.masksToBounds = true
        if Players.isDarkMode {
            webSite.tintColor = .black
            webSite.backgroundColor = .white
        } else {
            webSite.tintColor = .white
            webSite.backgroundColor = .darkGray
        }
    }
    
    func setBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.jpeg")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func gotoWeb(_ sender: Any) {
        performSegue(withIdentifier: "websiteViewController", sender: nil)
    }
}
