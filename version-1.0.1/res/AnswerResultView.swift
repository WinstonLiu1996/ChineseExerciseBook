//
//  AnswerResultView.swift
//  JiaoAn
//
//  Created by Marlon Ou on 2015-12-24.
//  Copyright (c) 2015 TPTJ. All rights reserved.
//

import UIKit

class AnswerResultView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var answerResultLabel : UILabel!
    @IBOutlet weak var answerResultImage : UIImageView!
    @IBOutlet weak var qViewCtrlerReference : UIViewController!
    func setTextForLabel(text : String){
        answerResultLabel.text = text

    }
    


}
