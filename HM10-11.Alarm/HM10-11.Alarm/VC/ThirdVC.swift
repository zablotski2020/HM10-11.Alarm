import UIKit

final class ThirdVC: UIViewController {

    @IBOutlet private weak var volumeProgress: UIProgressView!
    @IBOutlet private weak var volumeSlider: UISlider!
    @IBOutlet private weak var volumeField: UITextField!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var switchColor: UISwitch!
    @IBOutlet private weak var clearButton: UIButton!

    override func viewDidLoad() {
        // всегда в жизненных цикрах добавляйте super...
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func volumeSlider(_ sender: UISlider) {
        // volumeSlider и sender = это два указателя на объект UISlider
        volumeProgress.progress = sender.value
        let shortValue = round(Double(sender.value) * 10) / 10
        volumeField.text = String(shortValue)
        // placeholder
//        volumeField.placeholder = String(shortValue)
    }

    @IBAction private func textFieldAction(_ sender: Any) {
        if let text = volumeField.text,
            let vol = Float(text) {
            volumeProgress.progress = vol
            volumeSlider.value = vol
        } else {
            timeLabel.text = "Wrong value!!!"
        }
    }
    
    @IBAction private func setTime() {
        var hour = String(datePicker.calendar.component(.hour, from: datePicker.date))
        var min = String(datePicker.calendar.component(.minute, from: datePicker.date))
        if Int(hour)! < 10 {
            hour = "0" + hour
        }
        if Int(min)! < 10 {
            min = "0" + min
        }
        print("\(hour):\(min)")
        timeLabel.text = "\(hour):\(min)"
    }
    
    @IBAction private func switchingColours(_ sender: UISwitch) {
        if switchColor.isOn {
            timeLabel.backgroundColor = .yellow
        } else {
            timeLabel.backgroundColor = .lightGray
        }
    }

    @IBAction private func clearTimeLabel(_ sender: UIButton) {
        timeLabel.text = nil
        switchColor.isOn = false
        timeLabel.backgroundColor = .yellow
    }

    private func setupUI() {
        timeLabel.text = nil
        volumeSlider.value = 0.2
        volumeProgress.progress = volumeSlider.value
        volumeField.placeholder = String(volumeSlider.value)
    }
}

