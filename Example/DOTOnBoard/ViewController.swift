//
//  ViewController.swift
//  DOTOnBoard
//
//  Created by DioGnDev on 11/29/2018.
//  Copyright (c) 2018 DioGnDev. All rights reserved.
//

import UIKit
import DOTOnBoard

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var buttonSkip: UIButton!
    
    var board = OnBoardViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.setup(scrollView, pageControl)
        board.createSlides { () -> [Slide] in
            let slide1:Slide = Slide.loadNib()
            slide1.imageView.image = UIImage(named: "img_onboard1")
            slide1.labelTitle.text = "Update Harga & Transparan"
            slide1.labelDesc.text = "Harga selalu update dengan perkembangan pasar dan transparan"
            
            let slide2:Slide = Slide.loadNib()
            slide2.imageView.image = UIImage(named: "img_onboard2")
            slide2.labelTitle.text = "Kualitas Terjamin"
            slide2.labelDesc.text = "Jaminan barang terbaik dan standar yang sudah teruji"
            
            let slide3:Slide = Slide.loadNib()
            slide3.imageView.image = UIImage(named: "img_onboard3")
            slide3.labelTitle.text = "Transportasi"
            slide3.labelDesc.text = "Penjemputan dan pengantaran sampai ketempat anda"
            
            return [slide1, slide2, slide3]
        }
        
    }


}

