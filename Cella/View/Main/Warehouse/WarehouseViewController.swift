import UIKit

class WarehouseViewController: UIViewController{
    override func viewDidLoad() {
        drawUI()
    }
    
    private func drawUI(){
        view.backgroundColor = .white
        let layout = view.layoutMarginsGuide
        
        let titleLabel = UILabel()
        titleLabel.text = "Warehouses"
        titleLabel.font = titleLabel.font.withSize(24)
        addNeeded(v: titleLabel)
        titleLabel.topAnchor.constraint(equalTo: layout.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
    }
    
    func addNeeded(v: UIView){
        v.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(v)
    }
}
