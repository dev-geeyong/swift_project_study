

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nickName: UILabel!
    @IBOutlet var message: UILabel!
    @IBOutlet var phoneNumer: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var talking: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nickName.text = "IOS Master"
        message.text = "IOS training"
        phoneNumer.text = "010-3176-7777"
        phoneNumer.textAlignment = .right
        email.text = "wlwyd228@gmail.com"
        email.textAlignment = .right
        talking.text = "가나다라마바사ㅏ아아아아아아가나다라마바사ㅏ아아아아아아가나다라마바사ㅏ아아아아아아가나다라마바사ㅏ아아아아아아가나다라마바사ㅏ아아아아아아"
        talking.textColor = .brown
        
    }


}

