import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
//    let quiz = [
//        "Q1" : "Four + Two is equal to six",
//        "Q2" : "Five - Three is greater than one",
//        "Q3" : "Three + Eight is less than Ten"
//    ]
    
    let quiz = [
        ["Four + Two is equal to six", "True"],
        ["Five - Three is greater than one", "True"],
        ["Three + Eight is less than Ten", "False"]
    ]
    
    var number = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[number][1]
        updateUI()
        if(userAnswer==actualAnswer){
            print("Correct")
        }
        else{
            print("Wrong")
        }
        
        
        if (number<(quiz.count)-1){
            number+=1
        }
        else{
            number=0
        }
    }
    
    func updateUI(){
        questionLabel.text=quiz[number][0]
    }
    
}

