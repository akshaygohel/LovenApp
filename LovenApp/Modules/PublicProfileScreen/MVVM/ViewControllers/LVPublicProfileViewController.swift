//
//  LVPublicProfileViewController.swift
//  LovenApp
//
//  Created by Akshay Gohel on 2020-01-04.
//  Copyright © 2020 Akshay Gohel. All rights reserved.
//

import UIKit

class LVPublicProfileViewController: LVBaseViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
//    @IBOutlet weak var profileScrollView: UIScrollView!
    @IBOutlet weak var profileImageView: UIImageView!       // -> Should add Scroll View and then image/video inside it
    @IBOutlet weak var profileVideoPlayButton: UIButton!
    
    @IBOutlet weak var profileHeaderContainerView: UIView!
    @IBOutlet weak var profileTitleLabel: UILabel!
    @IBOutlet weak var notesButton: UIButton!
    @IBOutlet weak var notesCheckmarkImageView: UIImageView!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var setupDateButton: UIButton!
    @IBOutlet weak var statusIndicatorView: UIView!
    @IBOutlet weak var statusIndicatorLabel: UILabel!
    @IBOutlet weak var statusPercentLabel: UILabel!
    
    @IBOutlet weak var profileAboutContainerView: UIView!
    @IBOutlet weak var aboutTitleLabel: UILabel!
    @IBOutlet weak var aboutDescription: UILabel!
    
    @IBOutlet weak var profileInterestContainerView: UIView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    @IBOutlet weak var interestCollectionView: UICollectionView!
    
    var interestsArray: [String] = [String]()               // -> Should be array of model here

    override func viewDidLoad() {
        super.viewDidLoad()

        self.layoutUI()
        self.clearData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.populateData()
    }
    
}

extension LVPublicProfileViewController {

    @IBAction func backButtonTapped(_ button: UIButton!) {
        print("Back button tapped")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func playButtonTapped(_ button: UIButton!) {
        print("Play Video button tapped")
    }
    
    @IBAction func notesButtonTapped(_ button: UIButton!) {
        print("Notes button tapped")
    }
    
    @IBAction func chatButtonTapped(_ button: UIButton!) {
        print("Chat button tapped")
    }
    
    @IBAction func setupDateButtonTapped(_ button: UIButton!) {
        print("Setup Date button tapped")
    }

}

extension LVPublicProfileViewController {
    
    private func layoutUI() {
        self.profileHeaderContainerView.addCornerRadius()
        self.profileHeaderContainerView.dropShadow(color: .gray, opacity: 0.5, offSet: CGSize.init(width: 0, height: 5), radius: 10, scale: true)
        self.profileAboutContainerView.addCornerRadius()
        self.profileAboutContainerView.dropShadow(color: .gray, opacity: 0.5, offSet: CGSize.init(width: 0, height: 5), radius: 10, scale: true)
        self.profileInterestContainerView.addCornerRadius()
        self.profileInterestContainerView.dropShadow(color: .gray, opacity: 0.5, offSet: CGSize.init(width: 0, height: 5), radius: 10, scale: true)
        self.statusPercentLabel.addCornerRadius(withValue: Float(self.statusPercentLabel.bounds.size.height/2.0))
        self.statusPercentLabel.backgroundColor = UIColor.init(red: 214.0/255.0, green: 214.0/255.0, blue: 214.0/255.0, alpha: 1.0)
        self.statusPercentLabel.textColor = .white
        self.statusPercentLabel.textAlignment = .center
        
        self.statusIndicatorView.addCornerRadius(withValue: Float(self.statusIndicatorView.bounds.size.height/2.0))
        
        self.setFontsForLabels()
    }
    
    private func setFontsForLabels() {
        self.profileTitleLabel.font = UIFont.init(name: "Nunito-ExtraBold", size: 20)
        self.statusIndicatorLabel.font = UIFont.init(name: "FiraSansExtraCondensed-Regular", size: 14)
        self.statusPercentLabel.font = UIFont.init(name: "FiraSansCondensed-Regular", size: 12)
        
        self.aboutTitleLabel.font = UIFont.init(name: "FiraSans-Medium", size: 20)
        self.aboutDescription.font = UIFont.init(name: "Nunito-Regular", size: 18)
        
        self.interestTitleLabel.font = UIFont.init(name: "FiraSans-Medium", size: 20)
    }
    
}

extension LVPublicProfileViewController {
    
    private func clearData() {
        self.profileTitleLabel.text = ""
        self.statusIndicatorView.backgroundColor = UIColor.green
        self.statusIndicatorLabel.text = ""
        self.statusPercentLabel.text = ""
        
        self.aboutTitleLabel.text = "About her"
        self.aboutDescription.text = ""
        
        self.interestTitleLabel.text = "Her interests"
        self.interestsArray = [String]()
        self.interestCollectionView.reloadData()
    }
    
    private func populateData() {
        self.profileTitleLabel.text = "Margaret, 28"
        self.statusIndicatorView.backgroundColor = UIColor.green
        self.statusIndicatorLabel.text = "Active Now"
        self.statusPercentLabel.text = "65%"
        
        self.aboutTitleLabel.text = "About her"
        self.aboutDescription.text = "Product designer by day, animal lover and yoga enthusiast by night."
        
        self.interestTitleLabel.text = "Her interests"
        
        self.interestsArray = ["Women", "Men", "From 22 to 44"]
        self.interestCollectionView.reloadData()
        
    }
    
}

extension LVPublicProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.interestsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCell", for: indexPath) as! LVInterestCollectionViewCell
        
        cell.interestTitleLabel.text = ""
        
        if self.interestsArray.count > indexPath.item {
            cell.interestTitleLabel.text = self.interestsArray[indexPath.item]
        }
        
        cell.addCornerRadius(withValue: Float(cell.bounds.size.height/2.0))
        // Specify some logic to show colors as per interest. For now just simple switch should work to match UI Designs
        var color: UIColor = .lightGray
        switch indexPath.item {
        case 0:
            color = UIColor.init(red: 51.0/255.0, green: 138.0/255.0, blue: 254.0/255.0, alpha: 0.4)
        case 1:
            color = UIColor.init(red: 1.0, green: 89.0/255.0, blue: 146.0/255.0, alpha: 0.4)
        case 2:
            color = UIColor.init(red: 47.0/255.0, green: 233.0/255.0, blue: 163.0/255.0, alpha: 0.4)
        default:
            color = .lightGray
        }
        
        cell.interestTitleLabel.font = UIFont.init(name: "FiraSansExtraCondensed-Regular", size: 16)
        
        cell.interestTitleLabel.textColor = color
        cell.addBorder(withColor: color, thickness: 1.5)
        
        return cell
    }
    
    
}
