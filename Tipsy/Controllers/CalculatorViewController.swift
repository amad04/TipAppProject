import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
  
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    var tip = 0.0
    var total = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
       
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        //CurrenTitle
        let buttonTitle = sender.currentTitle!
        
        //Remove the last character (%)
        let buttonTitleMinusPercentageSign = String (buttonTitle.dropLast())
        
        //Turn the string to double
        let buttonAsNumber = Double (buttonTitleMinusPercentageSign)!
        
        //divde the number to get the precentage in decimal
        tip = buttonAsNumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String (Int (sender.value))
      
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billToDouble = Double(billTextField.text!)!
        let numberOfPerople = Double(splitNumberLabel.text!)!
        
        let calculate = ((billToDouble * tip) + billToDouble) / numberOfPerople
        let sumToDecimel = String(format: "%.2f", calculate )
        total = sumToDecimel
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = total
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = splitNumberLabel.text
            
        }
    }
}

