import UIKit

class LoadingAlert {
    struct Constants {
        static let backgroundAlphaTo: CGFloat = 0.6
    }
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        return backgroundView
    }()
    
    private let alertView: UIView = {
        let alert = UIView()
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 12
        alert.layer.masksToBounds = false
        alert.layer.shadowColor = UIColor.black.cgColor
        alert.layer.shadowOpacity = 0.5
        alert.layer.shadowRadius = 5
        return alert
    }()
    
    func show(on viewConstoller: RegisterViewController){
        backgroundView.frame = viewConstoller.view.bounds
        viewConstoller.view.addSubview(backgroundView)
        viewConstoller.view.addSubview(alertView)
        alertView.frame = CGRect(x: viewConstoller.view.frame.size.width/2-75, y: viewConstoller.view.frame.size.height/2-75, width: 150, height: 150)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        loadingIndicator.style = UIActivityIndicatorView.Style.large
        loadingIndicator.color = Color().hex("#FFC107")
        loadingIndicator.startAnimating()
        alertView.addSubview(loadingIndicator)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundView.alpha = Constants.backgroundAlphaTo
        })
    }
    
    func dismiss(){
        backgroundView.alpha = 0
        alertView.removeFromSuperview()
        backgroundView.removeFromSuperview()
    }
}
