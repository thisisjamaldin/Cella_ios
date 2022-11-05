import UIKit

class ProfileViewController: UIViewController{
    override func viewDidLoad() {
        drawUI()
    }
    
    private func drawUI(){
        view.backgroundColor = .white
        let layout = view.layoutMarginsGuide
        
        let titleLabel = UILabel()
        titleLabel.text = "Profile"
        titleLabel.font = titleLabel.font.withSize(24)
        addNeeded(v: titleLabel)
        titleLabel.topAnchor.constraint(equalTo: layout.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        let phoneLabel = UILabel()
        phoneLabel.text = "+12345678900"
        addNeeded(v: phoneLabel)
        phoneLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        let line1 = UIView()
        line1.backgroundColor = Color().grey()
        addNeeded(v: line1)
        line1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        line1.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 32).isActive = true
        line1.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        line1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let employeesBtn = UIButton()
        employeesBtn.setTitle("Employees", for: .normal)
        employeesBtn.setTitleColor(.black, for: .normal)
        employeesBtn.contentHorizontalAlignment = .left
        addNeeded(v: employeesBtn)
        employeesBtn.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 10).isActive = true
        employeesBtn.topAnchor.constraint(equalTo: line1.bottomAnchor).isActive = true
        employeesBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        employeesBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let line2 = UIView()
        line2.backgroundColor = Color().grey()
        addNeeded(v: line2)
        line2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        line2.topAnchor.constraint(equalTo: employeesBtn.bottomAnchor).isActive = true
        line2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        line2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let employersBtn = UIButton()
        employersBtn.setTitle("Employers", for: .normal)
        employersBtn.setTitleColor(.black, for: .normal)
        employersBtn.contentHorizontalAlignment = .left
        addNeeded(v: employersBtn)
        employersBtn.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 10).isActive = true
        employersBtn.topAnchor.constraint(equalTo: line2.bottomAnchor).isActive = true
        employersBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        employersBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let line3 = UIView()
        line3.backgroundColor = Color().grey()
        addNeeded(v: line3)
        line3.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        line3.topAnchor.constraint(equalTo: employersBtn.bottomAnchor).isActive = true
        line3.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        line3.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let addSealBtn = UIButton()
        addSealBtn.setTitle("Add seal", for: .normal)
        addSealBtn.setTitleColor(.black, for: .normal)
        addSealBtn.contentHorizontalAlignment = .left
        addNeeded(v: addSealBtn)
        addSealBtn.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 10).isActive = true
        addSealBtn.topAnchor.constraint(equalTo: line3.bottomAnchor).isActive = true
        addSealBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        addSealBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let line4 = UIView()
        line4.backgroundColor = Color().grey()
        addNeeded(v: line4)
        line4.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        line4.topAnchor.constraint(equalTo: addSealBtn.bottomAnchor).isActive = true
        line4.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        line4.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let settingsBtn = UIButton()
        settingsBtn.setTitle("Settings", for: .normal)
        settingsBtn.setTitleColor(.black, for: .normal)
        settingsBtn.contentHorizontalAlignment = .left
        addNeeded(v: settingsBtn)
        settingsBtn.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 10).isActive = true
        settingsBtn.topAnchor.constraint(equalTo: line4.bottomAnchor).isActive = true
        settingsBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        settingsBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let line5 = UIView()
        line5.backgroundColor = Color().grey()
        addNeeded(v: line5)
        line5.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        line5.topAnchor.constraint(equalTo: settingsBtn.bottomAnchor).isActive = true
        line5.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        line5.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let howItAllWorksBtn = UIButton()
        howItAllWorksBtn.setTitle("How it all works", for: .normal)
        howItAllWorksBtn.setTitleColor(.black, for: .normal)
        howItAllWorksBtn.contentHorizontalAlignment = .left
        addNeeded(v: howItAllWorksBtn)
        howItAllWorksBtn.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: 10).isActive = true
        howItAllWorksBtn.topAnchor.constraint(equalTo: line5.bottomAnchor).isActive = true
        howItAllWorksBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        howItAllWorksBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let line6 = UIView()
        line6.backgroundColor = Color().grey()
        addNeeded(v: line6)
        line6.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        line6.topAnchor.constraint(equalTo: howItAllWorksBtn.bottomAnchor).isActive = true
        line6.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        line6.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let versionLabel = UILabel()
        versionLabel.text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        addNeeded(v: versionLabel)
        versionLabel.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
        versionLabel.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -4).isActive = true
        
        let igImage = UIImageView(image: UIImage(named: "instagram"))
        addNeeded(v: igImage)
        igImage.widthAnchor.constraint(equalToConstant: 28).isActive = true
        igImage.heightAnchor.constraint(equalToConstant: 28).isActive = true
        igImage.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        igImage.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -12).isActive = true
        let productTapGesture = UITapGestureRecognizer(target: self, action: #selector(openIG))
        igImage.isUserInteractionEnabled = true
        igImage.addGestureRecognizer(productTapGesture)
        
    }
    
    @objc func openIG(){
        guard let url = URL(string: "http://www.instagram.com/cella.app") else {
          return
        }
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    func addNeeded(v: UIView){
        v.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(v)
    }
}
