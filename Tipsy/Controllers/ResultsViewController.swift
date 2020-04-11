import UIKit

class ResultsViewController: UIViewController {
    
    var result : String?
    var tip : Int? = 0
    var split : String?
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "\(result!) kr"
        settingsLabel.text = "Summan är delat på \(split!) personer med \(tip!)% i dricks"

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
    
        self.dismiss(animated: true, completion: nil)
    
    }
    
  
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
