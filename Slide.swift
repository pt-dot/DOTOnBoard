import UIKit

public class Slide: UIView {

    @IBOutlet public weak var imageView: UIImageView!
    @IBOutlet public weak var labelTitle: UILabel!
    @IBOutlet public weak var labelDesc: UILabel!
    
    public static func loadNib() -> Slide {
        let bundle = Bundle(for: Slide.self).loadNibNamed("Slide", owner: self, options: nil)
       
        let slide = bundle?.first as? Slide
        if let slideView = slide {
            return slideView
        }
        return Slide()
    }
    
}
