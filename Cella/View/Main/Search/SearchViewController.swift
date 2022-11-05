import UIKit
import FirebaseAuth

class SearchViewController: UIViewController{
    
    let searchField = UITextField()
    let debtButton = UIButton()
    let cartButton = UIButton()
    let cartLabel = UILabel()
    
    override func viewDidLoad() {
        drawUI()
    }
    
    private func drawUI(){
        view.backgroundColor = .white
        let layout = view.layoutMarginsGuide
        var paddingView: UIView
        
        let titleLabel = UILabel()
        titleLabel.text = "Search".localized()
        titleLabel.font = titleLabel.font.withSize(24)
        addNeeded(v: titleLabel)
        titleLabel.topAnchor.constraint(equalTo: layout.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        searchField.backgroundColor = Color().grey()
        searchField.layer.cornerRadius = 10
        searchField.placeholder = "Search..."
        searchField.leftView = paddingView
        searchField.rightView = paddingView
        searchField.leftViewMode = .always
        searchField.rightViewMode = .always
        addNeeded(v: searchField)
        searchField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        searchField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        searchField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        searchField.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -24).isActive = true
        
        let qrCode = UIImageView(image: UIImage(named: "qrCode"))
        qrCode.contentMode = .center
        addNeeded(v: qrCode)
        qrCode.trailingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: -12).isActive = true
        qrCode.topAnchor.constraint(equalTo: searchField.topAnchor).isActive = true
        qrCode.bottomAnchor.constraint(equalTo: searchField.bottomAnchor).isActive = true
        
        debtButton.backgroundColor = Color().yellow()
        debtButton.clipsToBounds = true
        debtButton.layer.cornerRadius = 23
        debtButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        addNeeded(v: debtButton)
        debtButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        debtButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        debtButton.bottomAnchor.constraint(equalTo: searchField.topAnchor, constant: -12).isActive = true
        debtButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        debtButton.addTarget(self, action: #selector(debtClicked), for: .touchUpInside)
        
        let debtLabel = UILabel()
        debtLabel.text = "Debt"
        debtLabel.textAlignment = .center
        debtLabel.font = debtLabel.font.withSize(14)
        addNeeded(v: debtLabel)
        debtLabel.bottomAnchor.constraint(equalTo: debtButton.bottomAnchor, constant: -2).isActive = true
        debtLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        debtLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        let debtImage = UIImageView(image: UIImage(named: "sandClock"))
        addNeeded(v: debtImage)
        debtImage.bottomAnchor.constraint(equalTo: debtLabel.topAnchor).isActive = true
        debtImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        debtImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        debtImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        
        cartButton.backgroundColor = Color().yellow()
        cartButton.clipsToBounds = true
        cartButton.layer.cornerRadius = 23
        cartButton.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        view.addSubview(cartButton)
        cartButton.frame = CGRect(x: UIScreen.main.bounds.size.width, y: UIScreen.main.bounds.size.height-212, width: 70, height: 46)
        cartButton.addTarget(self, action: #selector(cartClicked), for: .touchUpInside)
        
        cartLabel.text = "0"
        cartLabel.textAlignment = .center
        cartLabel.backgroundColor = .white
        cartLabel.layer.cornerRadius = 12
        cartLabel.layer.borderColor = Color().grey().cgColor
        cartLabel.layer.borderWidth = 2
        cartLabel.layer.masksToBounds = true
        cartLabel.font = cartLabel.font.withSize(12)
        view.addSubview(cartLabel)
        cartLabel.frame = CGRect(x: UIScreen.main.bounds.size.width, y: UIScreen.main.bounds.size.height-214, width: 24, height: 24)

        let cartImage = UIImageView(image: UIImage(named: "cart"))
        cartImage.frame = CGRect(x: 22, y: 10, width: 26, height: 26)
        cartButton.addSubview(cartImage)
    }
    
    @objc func debtClicked(){
//        let navigationViewController = UINavigationController()
//        navigationViewController.setViewControllers([RegisterViewController()], animated: true)
//        self.view.addSubview(navigationViewController.view)
//        self.addChild(navigationViewController)
//        navigationViewController.didMove(toParent: self)
        UIView.animate(withDuration: 0.3, animations: {
            self.cartButton.frame = CGRect(x: UIScreen.main.bounds.size.width-70, y: UIScreen.main.bounds.size.height-212, width: 70, height: 46)
            self.cartLabel.frame = CGRect(x: UIScreen.main.bounds.size.width-74, y: UIScreen.main.bounds.size.height-214, width: 24, height: 24)
        })
    }
    @objc func cartClicked(){
        UIView.animate(withDuration: 0.2, animations: {
            self.cartButton.frame = CGRect(x: UIScreen.main.bounds.size.width, y: UIScreen.main.bounds.size.height-212, width: 70, height: 46)
            self.cartLabel.frame = CGRect(x: UIScreen.main.bounds.size.width, y: UIScreen.main.bounds.size.height-214, width: 24, height: 24)
        })
    }
    
    func addNeeded(v: UIView){
        v.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(v)
    }
}
