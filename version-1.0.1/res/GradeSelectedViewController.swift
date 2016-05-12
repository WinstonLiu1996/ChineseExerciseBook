//
//  GradeSelectedViewController.swift
//  JiaoAn
//
//  Created by Marlon Ou on 2016-01-03.
//  Copyright (c) 2016 TPTJ. All rights reserved.
//

import UIKit

class GradeSelectedViewController: UIViewController {
    
    //from grade selection view, taping on certain image sets name var
    //from question view, the name var is determined by current problem sets' title information
    //For progress bar or difficulty infomation: when the UIImage is determined, when which grade we are in. Pull from database for the information

    
    
    
    
    @IBOutlet weak var displayImage: UIImageView!
    var name : String?
    var nameForLevelTest : String?//Used when selects level test. Since name has to be used in selec..provider func as leveltest, this extra string is needed for identifying what grade. Regular exercise doesnot require this. because name is directly used for grade identification between views.
    @IBOutlet weak var fallLabel: UILabel!
    @IBOutlet weak var winterLabel: UILabel!
    @IBOutlet weak var summerLabel: UILabel!
    
    var myGrade:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGrade = name
        
        if name != nil{
            displayImage.image = UIImage(named: name!)
            
        }
        print("\(name)")
        fallLabel.textColor = UIColor.blackColor()
        winterLabel.textColor = UIColor.blackColor()
        summerLabel.textColor = UIColor.blackColor()
        
        let dif = getDifficulty()
        if(dif == 0){
            fallLabel.textColor = UIColor.blueColor()
        }else if (dif == 1){
            winterLabel.textColor = UIColor.blueColor()
        }else if (dif == 2){
            summerLabel.textColor = UIColor.blueColor()
        }else{
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toLevelTest(sender: AnyObject) {
        nameForLevelTest = name!
        name = "levelTest"
        performSegueWithIdentifier("selectedToQView", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        selectedToQViewQuestionProvider(segue, grade: name!)
    }
    
    
    private func selectedToQViewQuestionProvider(segue : UIStoryboardSegue, var grade : String){
        
        if segue.identifier ==  "selectedToQView"{
            let desView = segue.destinationViewController as! QuestionViewController
            var index = self.getQuestionArrayIndex()
            print("index is \(index)");
            
            var dif = self.getDifficulty();
            if(dif == 3){
                grade = "levelTest";
            }
            
            switch grade {
            case "grade 7":
                if(dif == 0){
                    desView.problemSet = Grade7().fall[index]
                }else if (dif == 1){
                    desView.problemSet = Grade7().winter[index]
                }else  if (dif == 2){
                    desView.problemSet = Grade7().summer[index]
                }
                desView.myGrade = name!
                desView.islevelTest = false;
                
                
            case "grade 8":
                if(dif == 0){
                    desView.problemSet = Grade8().fall[index]
                    
                }else if (dif == 1){
                    desView.problemSet = Grade8().winter[index]
                    
                }else if (dif == 2) {
                    desView.problemSet = Grade8().summer[index]
                    
                }
                desView.myGrade = name!
                desView.islevelTest = false;
                
                
                
            case "grade 9":
                if(dif == 0){
                    desView.problemSet = Grade9().fall[index]
                    
                }else if (dif == 1){
                    desView.problemSet = Grade9().winter[index]
                    
                }else if (dif == 2){
                    desView.problemSet = Grade9().summer[index]
                    
                }
                desView.myGrade = name!
                desView.islevelTest = false;
                
                
                
            case "levelTest":
                switch myGrade!{
                case "grade 7":
                    desView.problemSet = LevelTest.array1[index]
                case "grade 8":
                    desView.problemSet = LevelTest.array2[index]
                case "grade 9":
                    desView.problemSet = LevelTest.array3[index]
                default:
                    break
                }
                
                desView.myGrade = nameForLevelTest!
                
                desView.islevelTest = true;
                
                
            default:
                print("***Error")
            }
            
        }
        
    }
    
    func getQuestionArrayIndex() -> Int{
        let userDefaults = NSUserDefaults.standardUserDefaults();
        if(userDefaults.objectForKey("index") != nil){
            var index = userDefaults.integerForKey("index");
            if(index == 2){
                userDefaults.setInteger(0, forKey: "index");
                userDefaults.synchronize();
                return 0;
            }else{
                var nextIndex = index + 1;
                userDefaults.setInteger(nextIndex, forKey: "index");
                userDefaults.synchronize();
                return index;
            }
        }else{
            userDefaults.setInteger(0, forKey: "index");
            userDefaults.synchronize();
            return 0;
        }
    }
    
    
    func setQuestionArrayIndex(index:Int){
        let userDefaults = NSUserDefaults.standardUserDefaults();
        userDefaults.setInteger(index, forKey: "index");
        userDefaults.synchronize();
    }
    
    func getDifficulty() -> Int{
        // fall : 0
        // winter : 1
        // summer : 2
        // need to do level test: 3
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
        if(userDefaults.objectForKey(key) != nil){
            return userDefaults.integerForKey(key);
        }else{
            return 3;
        }
    }
    
    @IBAction func practiceTapGesture(sender: AnyObject) {
        //        let dif = getDifficulty();
        //        print("dif is \(dif)")
        //        if(dif == 3){
        //            let alert = UIAlertView.init(title: "请先做水平测试", message: nil, delegate: self, cancelButtonTitle: "OK")
        //            alert.show()
        //        }else{
        //            performSegueWithIdentifier("selectedToQView", sender: sender)
        //        }
        //
    }
    
    
    @IBAction func doPractice(sender: AnyObject) {
        let dif = getDifficulty();
        print("dif is \(dif)")
        if(dif == 3){
            let alert = UIAlertView.init(title: "请先做水平测试", message: nil, delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }else{
            performSegueWithIdentifier("selectedToQView", sender: sender)
        }
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

}






