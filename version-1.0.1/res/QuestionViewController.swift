//
//  ViewController.swift
//  JiaoAn
//
//  Created by Marlon Ou on 2015-12-22.
//  Copyright (c) 2015 TPTJ. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //typeOtherInfoLabel stores information of title param. Use this to decide display of grade selected view when tap back image view
    

    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    
    @IBOutlet weak var mainQContainerView: UIView!
    
   
    @IBOutlet weak var mainQuestionLabel: UILabel!
    
    @IBOutlet weak var answerALabel: UILabel!
   
    @IBOutlet weak var answerBLabel: UILabel!
    
    @IBOutlet weak var answerCLabel: UILabel!
    
    @IBOutlet weak var answerDLabel: UILabel!
    
    
    @IBOutlet weak var submitButton: UIButton!
    
    private var selectedA = false
    private var selectedB = false
    private var selectedC = false
    private var selectedD = false
    private var numselected : Int = 0 //super important field. also used to handle cases like 012
    
    //byron's
    var multiple4 : Multiple4Choice?
    let analysis = "analysis: blabla.........."
    var problemSet : [Question] = []
    var islevelTest:Bool!
    var myGrade : String?
    var numCorrectAnswer : Int = 0

    
    var correctChoice : Int?
    
    var selection : Int?
    

    //var fillInBlank : ?????
    
    private var jumpToNext : Bool = false
    
    // progress recorder
    private var current : Int = 0{
        // property observer
        didSet {
            let progress_rate = Float(current) / Float(problemSet.count)
            let animated = current != 0
            
            progressView.setProgress(progress_rate, animated: animated)
            progressLabel.text = ("\(Int(progress_rate * 100))%")
        }
    }
    
    

    func shuffle(){
        //TODO
        
    }
    
    
    var unselectedColor : UIColor?
    //var selectedColor : UIColor = UIColor(red: 100, green: 100, blue: 255, alpha: 0.5)
    var selectedColor : UIColor = UIColor.grayColor()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        unselectedColor = answerALabel.backgroundColor
        
        loadQuestion()
        
        numCorrectAnswer = 0
        
        // progress bar
        progressView.setProgress(0.0, animated: true)
          print("isLevelTest \(islevelTest)")
        
//        // Set label gesture recognizer
//        let tapA:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "answerALabelAction:")
//        view.addGestureRecognizer(tapA)
//        answerALabel.userInteractionEnabled = true
//        let tapB:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "answerBLabelAction:")
//        view.addGestureRecognizer(tapB)
//        answerBLabel.userInteractionEnabled = true
//        let tapC:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "answerCLabelAction:")
//        view.addGestureRecognizer(tapC)
//        answerCLabel.userInteractionEnabled = true
//        let tapD:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "answerDLabelAction:")
//        view.addGestureRecognizer(tapD)
//        answerDLabel.userInteractionEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //Below Section for answer selection
    
    
    @IBOutlet weak var answerResultView: AnswerResultView!
    
    private func curlDownAnimation(view : UIView,animationTime : Float){
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(NSTimeInterval(animationTime))
        UIView.setAnimationTransition(UIViewAnimationTransition.CurlDown, forView: view, cache: false)
        UIView.commitAnimations()
    }
    
    func goBackFunc(alert:UIAlertAction!){
        //Print out you have finished all questions, please hit back button to go back to grade selected view
        self.curlDownAnimation(answerResultView, animationTime: 1.0)
        answerResultView.hidden = false
        //display: completed picture
        //hault question view controller
        
        questionBackTap("")
        
        /*let vc = self.storyboard?.instantiateViewControllerWithIdentifier("GradeSelectedVC") as! GradeSelectedViewController
        self.presentViewController(vc, animated: true, completion: nil)*/
    }
    
    func setDifficulty(dif:Int){
        var key = "grade7difficulty"
        switch myGrade!{
        case "grade 7":
            break
        case "grade 8":
            key = "grade8difficulty"
        case "grade 9":
            key = "grade9difficulty"
        default:
            break
            
        }
        
        let userDefaults = NSUserDefaults.standardUserDefaults();
        userDefaults.setInteger(dif, forKey: key)
        userDefaults.synchronize()
    }
    
    
    @IBAction func submitButton(sender: AnyObject) {
        
        
        if jumpToNext {
            
            
            if current >= problemSet.count{
                let alter = UIAlertController(title: "恭喜你", message: "你已经完成所有题目，共答对\(numCorrectAnswer)/\(problemSet.count)题，点击确定返回上一界面",preferredStyle: .Alert)
                let goBack = UIAlertAction(title: "确定", style: .Default, handler: goBackFunc)
                alter.addAction(goBack)
                //set difficulty
                var setDifTo = 0
                if((self.islevelTest) != nil){
                    if(self.islevelTest!){
                        if(numCorrectAnswer == 0 || numCorrectAnswer == 1){
                            setDifTo = 0
                        }else if(numCorrectAnswer == 2 || numCorrectAnswer == 3){
                            setDifTo = 1
                        }else if(numCorrectAnswer >= 4){
                            setDifTo = 2
                        }else{
                            setDifTo = 3
                        }
                        self.setDifficulty(setDifTo)
                    }
                }
                presentViewController(alter, animated: true, completion: nil)
            }else{
                prepareForNext()
                loadQuestion()
                answerResultView.hidden = true
                self.jumpToNext = false
                return //nothing
            }
            
        }else{
            
            
            //To make animation go with view's appearance(unhide it) set the hidden property to false AFTER animation call
            if selection != nil{
                self.curlDownAnimation(answerResultView, animationTime: 1.0)
                answerResultView.hidden = false
                if matchWithCorrect(){
                    answerResultView.answerResultImage.image = UIImage(named: "correct")
                    answerResultView.setTextForLabel("correct")
                    
                    numCorrectAnswer++
                    
                }
                else {
                    answerResultView.answerResultImage.image = UIImage(named: "wrong")
                    answerResultView.setTextForLabel("incorrect")
                }
                
                current++
                self.jumpToNext = true
            }
        }
        
        
    }
    
    
    
    // Receive action
    
    @IBAction func answerALabelAction(recognizer:UITapGestureRecognizer)
    {
        if selectedA {
            selectedA = false
            removeChoice(0)
            numselected--
            answerALabel.backgroundColor = unselectedColor
            
            
        }else{
            selectedA = true
            addChoice(0)
            numselected++
            answerALabel.backgroundColor = selectedColor
        }
    }
    
    
    
    @IBAction func answerBLabelAction(recognizer:UITapGestureRecognizer) {
        if selectedB {
            selectedB = false
            removeChoice(1)
            numselected--
            answerBLabel.backgroundColor = unselectedColor
        }else{
            selectedB = true
            addChoice(1)
            numselected++
            answerBLabel.backgroundColor = selectedColor
        }
    }
    
    @IBAction func answerCLabelAction(recognizer:UITapGestureRecognizer) {
        if selectedC {
            selectedC = false
            removeChoice(2)
            numselected--
            answerCLabel.backgroundColor = unselectedColor
        }else{
            selectedC = true
            addChoice(2)
            numselected++
            answerCLabel.backgroundColor = selectedColor
        }
    }
    
    @IBAction func answerDLabelAction(recognizer:UITapGestureRecognizer) {
        if selectedD {
            selectedD = false
            removeChoice(3)
            numselected--
            answerDLabel.backgroundColor = unselectedColor
            
        }else{
            selectedD = true
            addChoice(3)
            numselected++
            answerDLabel.backgroundColor = selectedColor
        }
    }
    
    //Above section for answer selection
    
    //Below section for back to grade selected
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let desView = segue.destinationViewController as! GradeSelectedViewController
        //desView.name = typeOtherInfoLabel.text!
        desView.name = myGrade!
        
    }
    
    @IBAction func questionBackTap(sender: AnyObject) {
        performSegueWithIdentifier("questionToSelected", sender: sender)
    }
    
    private func prepareForNext(){
        multiple4 = nil //all Qs set to nil before load. For type recognizing purposes
        selection = nil //set to nil to avoid  bug
        numselected = 0 //set to zero to avoid bug
        selectedA = false
        selectedB = false
        selectedC = false
        selectedD = false
        answerALabel.backgroundColor = unselectedColor
        answerBLabel.backgroundColor = unselectedColor
        answerCLabel.backgroundColor = unselectedColor
        answerDLabel.backgroundColor = unselectedColor
    }
    
    private func loadQuestion(){
        //clear up information and fill for next question
        let q : Question = self.problemSet[current]
        
        if let t = q as? Multiple4Choice{
            multiple4 = t
        }
        //else, other type of questions?
        
        if multiple4 != nil{
           // difficultyImage.image = UIImage(named: multiple4!.difficulty.rawValue)
           //typeOtherInfoLabel.text = multiple4!.title
            mainQuestionLabel.text = multiple4!.mainQuestion
            answerALabel.text = "A. \(multiple4!.answers[0])"
            answerBLabel.text = "B. \(multiple4!.answers[1])"
            answerCLabel.text = "C. \(multiple4!.answers[2])"
            answerDLabel.text = "D. \(multiple4!.answers[3])"
            correctChoice = multiple4?.correct
        }
        
        //answer type fill in blank??
        
    }
    
    private func addChoice(ans : Int){
        //TODO
        if selection == nil{ selection = ans; return; }
        selection = (selection! * 10) + ans
    }
    
    private func removeChoice(item : Int){
        //TODO
        var ansArray : [Int] = []
        for var i = 0 ; i < numselected ; ++i {
            ansArray.append(selection!%10)
            selection = selection! / 10
        }
        //Always set selection to nil when all chocies pulled out
        selection = nil
        ansArray.removeAtIndex(ansArray.indexOf(item)!)
        for a in ansArray{
            addChoice(a)
        }
    }
    
    private func matchWithCorrect()->Bool{
        //TODO
        //IMPORTANT: choice 0 cannot be place in the front!
        //Ans matching requires correctAns's digits to be in DECSENDING ORDER
        var ansArray : [Int] = []
        for var i = 0 ; i < numselected ; ++i {
            ansArray.append(selection!%10)
            selection = selection! / 10
        }
        selection = nil
        ansArray.sortInPlace({(a : Int, b : Int) -> Bool in
            return a > b
        })
        print(ansArray)
        for a in ansArray{
            addChoice(a)
        }
        
        return selection! == correctChoice!;
    }
    
}

