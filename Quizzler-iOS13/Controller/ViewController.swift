import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreHandler: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
  
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(false)
        progressBar.progress = 0
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        prog()
                let userAnswer = sender.currentTitle!
        //let actualAnswer = quiz[number].answer
        
       let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if(userGotItRight){
            animateButtonColorChange(sender, color: UIColor.green)
                   } else {
                       animateButtonColorChange(sender, color: UIColor.red)
                   }
        
        updateUI(userGotItRight)
        

    }
    
    func updateUI(_ answer:Bool){
        questionLabel.text=quizBrain.getQuestionText()
        scoreHandler.text = "Score: \(quizBrain.score(answer))"
//        trueButton.backgroundColor = UIColor.clear
//        falseButton.backgroundColor = UIColor.clear
    }
    
    func prog(){
        progressBar.progress = quizBrain.progressData()
    }
    
    func animateButtonColorChange(_ button: UIButton, color: UIColor) {
            UIView.animate(withDuration: 0.1, animations: {
                button.backgroundColor = color
            }) { (_) in
                UIView.animate(withDuration: 0.1) {
                    button.backgroundColor = UIColor.clear
                }
            }
        }
    
}

