//
//  GradeSelectionViewController.swift
//  JiaoAn
//
//  Created by Marlon Ou on 2015-12-23.
//  Copyright (c) 2015 TPTJ. All rights reserved.
//

import UIKit

class GradeSelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender is Grade7{
            if segue.identifier == "toTestViewSegue"//is actually intermediate view
            {
                let desView = segue.destinationViewController as! GradeSelectedViewController
                desView.name = "grade 7"
            }
        }else if sender is Grade8{
            if segue.identifier == "toTestViewSegue"//is actually intermediate view
            {
                let desView = segue.destinationViewController as! GradeSelectedViewController
                desView.name = "grade 8"
            }
        }else if sender is Grade9{
            if segue.identifier == "toTestViewSegue"//is actually intermediate view
            {
                let desView = segue.destinationViewController as! GradeSelectedViewController
                desView.name = "grade 9"
            }
        }
    }
    
    @IBAction func gradeSelectionTapGesture(sender: AnyObject) {
        performSegueWithIdentifier("toTestViewSegue", sender: sender)
    }
}


























/*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
if sender is Grade7{
let gradeSelection = sender as! Grade7

provideMultiple4ChoiceToTestView(segue, question: Samples().samples[0])

println("*** Selected Grade 7")

} else if sender is Grade8{
let gradeSelection = sender as! Grade8

provideMultiple4ChoiceToTestView(segue, question: Samples().samples[1])

println("*** Selected Grade 8")
} else if sender is Grade9{
let gradeSelection = sender as! Grade9

provideMultiple4ChoiceToTestView(segue, question: Samples().samples[2])
println("*** Grade 9")
}
println("Done")
}

private func provideMultiple4ChoiceToTestView(segue : UIStoryboardSegue, question : Multiple4Choice){
if segue.identifier == "toTestViewSegue"{
let desView = segue.destinationViewController as! QuestionViewController
desView.multiple4 = question

}
}


@IBAction func gradeSelectionTapGesture(sender: AnyObject) {
performSegueWithIdentifier("toTestViewSegue", sender: sender)
}*/
