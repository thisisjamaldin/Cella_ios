import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    let nameField = UITextField()
    let phoneField = UITextField()
    let smsLabel = UILabel()
    let smsField = UITextField()
    let smsInfo = UILabel()
    
    var errorView = UIView()
    
    let loading = LoadingAlert()
    
    var handle: AuthStateDidChangeListenerHandle?
    var verificationID = UserDefaults.standard.string(forKey: "authVerificationID")

    override func viewDidLoad() {
        drawUI()
    }
    
    func drawUI(){
        view.backgroundColor = .white
        let layout = view.layoutMarginsGuide
        var paddingView: UIView
        
        let titleLabel = UILabel()
        titleLabel.text = "Register"
        titleLabel.font = titleLabel.font.withSize(24)
        addNeeded(v: titleLabel)
        titleLabel.topAnchor.constraint(equalTo: layout.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        smsInfo.text = "Please fill in your phone number\nto receive an SMS code"
        smsInfo.numberOfLines = 0
        smsInfo.textAlignment = .center
        addNeeded(v: smsInfo)
        smsInfo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        smsInfo.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        smsInfo.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        phoneField.layer.cornerRadius = 10
        phoneField.keyboardType = .phonePad
        phoneField.leftView = paddingView
        phoneField.rightView = paddingView
        phoneField.leftViewMode = .always
        phoneField.rightViewMode = .always
        addNeeded(v: phoneField)
        phoneField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        phoneField.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
        phoneField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        phoneField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        phoneField.backgroundColor = Color().grey()
        phoneField.addTarget(self, action: #selector(hideError), for: .touchDown)
        
        let phoneLabel = UILabel()
        phoneLabel.text = "Phone number"
        phoneLabel.textColor = Color().darkGrey()
        phoneLabel.font = phoneLabel.font.withSize(12)
        addNeeded(v: phoneLabel)
        phoneLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        phoneLabel.bottomAnchor.constraint(equalTo: phoneField.topAnchor, constant: -2).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        nameField.layer.cornerRadius = 10
        nameField.leftView = paddingView
        nameField.rightView = paddingView
        nameField.leftViewMode = .always
        nameField.rightViewMode = .always
        addNeeded(v: nameField)
        nameField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        nameField.bottomAnchor.constraint(equalTo: phoneLabel.topAnchor, constant: -12).isActive = true
        nameField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        nameField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        nameField.backgroundColor = Color().grey()
        
        let nameLabel = UILabel()
        nameLabel.text = "Full name"
        nameLabel.textColor = Color().darkGrey()
        nameLabel.font = nameLabel.font.withSize(12)
        addNeeded(v: nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: nameField.topAnchor, constant: -2).isActive = true
        
        smsLabel.text = "SMS code"
        smsLabel.textColor = Color().darkGrey()
        smsLabel.font = smsLabel.font.withSize(12)
        addNeeded(v: smsLabel)
        smsLabel.isHidden = true
        smsLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        smsLabel.topAnchor.constraint(equalTo: phoneField.bottomAnchor, constant: 12).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        smsField.layer.cornerRadius = 10
        smsField.keyboardType = .numberPad
        smsField.leftView = paddingView
        smsField.rightView = paddingView
        smsField.leftViewMode = .always
        smsField.rightViewMode = .always
        addNeeded(v: smsField)
        smsField.isHidden = true
        smsField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        smsField.topAnchor.constraint(equalTo: smsLabel.bottomAnchor, constant: 2).isActive = true
        smsField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        smsField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        smsField.backgroundColor = Color().grey()
        
        let continueBtn = UIButton()
        continueBtn.setTitle("Continue", for: .normal)
        continueBtn.setTitleColor(.black, for: .normal)
        continueBtn.backgroundColor = Color().yellow()
        continueBtn.layer.cornerRadius = 10
        addNeeded(v: continueBtn)
        continueBtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
        continueBtn.topAnchor.constraint(equalTo: smsField.bottomAnchor, constant: 12).isActive = true
        continueBtn.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        continueBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        continueBtn.addTarget(self, action:#selector(continueClicked), for: .touchUpInside)
        
        let bottomInfo = UILabel()
        bottomInfo.text = "Simple, Secure, Fast"
        bottomInfo.textAlignment = .center
        addNeeded(v: bottomInfo)
        bottomInfo.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        bottomInfo.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        bottomInfo.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -20).isActive = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    func addNeeded(v: UIView){
        v.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(v)
    }
    
    @objc func continueClicked(){
        loading.show(on: self)
        if nameField.text == "" {
            Toast().show(on: self, text: "Fill name")
            showError(v: nameField)
            self.loading.dismiss()
        } else if smsField.isHidden{
            Auth.auth().languageCode = "ru"
            //        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
            PhoneAuthProvider.provider()
                .verifyPhoneNumber(phoneField.text ?? "+", uiDelegate: nil) { verificationID, error in
                    if error != nil {
                        self.showError(v: self.phoneField)
                        Toast().show(on: self, text: "Failed")
                    } else {
                        self.smsLabel.isHidden = false
                        self.smsField.isHidden = false
                        self.smsInfo.text = "We have send an SMS to \(self.phoneField.text ?? "+0")\n please enter it below"
                        self.nameField.isEnabled = false
                        self.phoneField.isEnabled = false
                        self.verificationID = verificationID
                        UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
                    }
                    self.loading.dismiss()
                }
        }
        else {
            let credential = PhoneAuthProvider.provider().credential(
              withVerificationID: verificationID ?? "1",
              verificationCode: smsField.text ?? "1"
            )
            signIn(credential: credential)
        }
    }
    
    func showError(v: UIView){
        errorView = v
        v.layer.borderColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1).cgColor
        v.layer.borderWidth = 1
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(hideError), userInfo: nil, repeats: false)
    }
    
    @objc func hideError() {
        errorView.layer.borderWidth = 0
    }
    
    func signIn(credential: AuthCredential){
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                Toast().show(on: self, text: "\(error)")
              return
            }
            let navigationViewController = UINavigationController()
            navigationViewController.setViewControllers([MainViewController()], animated: true)
            self.view.addSubview(navigationViewController.view)
            self.addChild(navigationViewController)
            navigationViewController.didMove(toParent: self)
            self.loading.dismiss()
        }
    }
    

}

