import UIKit

class Toast {
    
    private let alertView: UIView = {
        let alert = UIView()
        alert.backgroundColor = Color().hex("#e6e6e6")
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 12
        alert.layer.masksToBounds = false
        alert.alpha = 0
        return alert
    }()
    
    func show(on viewConstoller: RegisterViewController, text: String){
        viewConstoller.view.addSubview(alertView)
        alertView.frame = CGRect(x: viewConstoller.view.frame.size.width/2-75, y: viewConstoller.view.frame.size.height-120, width: 150, height: 40)
        
        let msg = UILabel()
        msg.text = text
        msg.textColor = .black
        alertView.addSubview(msg)
        msg.translatesAutoresizingMaskIntoConstraints = false
        msg.centerYAnchor.constraint(equalTo: alertView.centerYAnchor).isActive = true
        msg.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        UIView.animate(withDuration: 0.2, animations: {
            self.alertView.frame = CGRect(x: viewConstoller.view.frame.size.width/2-75, y: viewConstoller.view.frame.size.height-150, width: 150, height: 40)
            self.alertView.alpha = 1
        })
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(dismiss), userInfo: nil, repeats: false)
    }
    
    @objc func dismiss(){
        self.alertView.removeFromSuperview()
    }
}
