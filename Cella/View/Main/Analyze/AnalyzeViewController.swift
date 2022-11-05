import UIKit

class AnalyzeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var buyingFilter = true
    var sellingFilter = false
    
    let dropDownDialog = UITableView()
    var dropDownIcon = UIImageView()
    var dropDownView = UIView()
    var dropDownLst = [String]()
    
    let warehouseBtn = UIButton()
    let employeeBtn = UIButton()
    let fromDate = UIButton()
    let toDate = UIButton()
    
    var datePickerView = UIButton()
    var datePickerToolbar = UIToolbar()
    let timeFormatter = DateFormatter()
    let datePicker = UIDatePicker()
    
    let warehouseDropDownIcon = UIImageView(image: UIImage(named: "downArrow"))
    let employeeDropDownIcon = UIImageView(image: UIImage(named: "downArrow"))
    
    override func viewDidLoad() {
        drawUI()
        
        dropDownDialog.delegate = self
        dropDownDialog.dataSource = self
        dropDownDialog.register(DropDownCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func drawUI(){
        view.backgroundColor = .white
        let layout = view.layoutMarginsGuide
        var paddingView: UIView
        timeFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        
        let titleLabel = UILabel()
        titleLabel.text = "Analyze"
        titleLabel.font = titleLabel.font.withSize(24)
        addNeeded(v: titleLabel)
        titleLabel.topAnchor.constraint(equalTo: layout.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        let warehouseLabel = UILabel()
        warehouseLabel.text = "Warehouse".localized()
        warehouseLabel.textColor = Color().darkGrey()
        warehouseLabel.font = warehouseLabel.font.withSize(12)
        addNeeded(v: warehouseLabel)
        warehouseLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        warehouseLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        warehouseBtn.backgroundColor = Color().grey()
        warehouseBtn.setTitle("All", for: .normal)
        warehouseBtn.titleLabel?.font = warehouseBtn.titleLabel?.font.withSize(17)
        warehouseBtn.contentHorizontalAlignment = .left
        warehouseBtn.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 20.0)
        warehouseBtn.setTitleColor(.black, for: .normal)
        warehouseBtn.layer.cornerRadius = 10
        addNeeded(v: warehouseBtn)
        warehouseBtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
        warehouseBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        warehouseBtn.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        warehouseBtn.topAnchor.constraint(equalTo: warehouseLabel.bottomAnchor).isActive = true
        warehouseBtn.addTarget(self, action: #selector(pickWarehouse), for: .touchUpInside)
        
        addNeeded(v: warehouseDropDownIcon)
        warehouseDropDownIcon.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -12).isActive = true
        warehouseDropDownIcon.topAnchor.constraint(equalTo: warehouseBtn.topAnchor).isActive = true
        warehouseDropDownIcon.bottomAnchor.constraint(equalTo: warehouseBtn.bottomAnchor).isActive = true
        warehouseDropDownIcon.contentMode = .center
        
        let employeeLabel = UILabel()
        employeeLabel.text = "Employee".localized()
        employeeLabel.textColor = Color().darkGrey()
        employeeLabel.font = employeeLabel.font.withSize(12)
        addNeeded(v: employeeLabel)
        employeeLabel.topAnchor.constraint(equalTo: warehouseBtn.bottomAnchor, constant: 12).isActive = true
        employeeLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        employeeBtn.backgroundColor = Color().grey()
        employeeBtn.setTitle("All", for: .normal)
        employeeBtn.titleLabel?.font = employeeBtn.titleLabel?.font.withSize(17)
        employeeBtn.contentHorizontalAlignment = .left
        employeeBtn.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 20.0)
        employeeBtn.setTitleColor(.black, for: .normal)
        employeeBtn.layer.cornerRadius = 10
        addNeeded(v: employeeBtn)
        employeeBtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
        employeeBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        employeeBtn.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        employeeBtn.topAnchor.constraint(equalTo: employeeLabel.bottomAnchor).isActive = true
        employeeBtn.addTarget(self, action: #selector(pickEmployee), for: .touchUpInside)
        
        addNeeded(v: employeeDropDownIcon)
        employeeDropDownIcon.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -12).isActive = true
        employeeDropDownIcon.topAnchor.constraint(equalTo: employeeBtn.topAnchor).isActive = true
        employeeDropDownIcon.bottomAnchor.constraint(equalTo: employeeBtn.bottomAnchor).isActive = true
        employeeDropDownIcon.contentMode = .center
        
        let codeLabel = UILabel()
        codeLabel.text = "Code or Name".localized()
        codeLabel.textColor = Color().darkGrey()
        codeLabel.font = codeLabel.font.withSize(12)
        addNeeded(v: codeLabel)
        codeLabel.topAnchor.constraint(equalTo: employeeBtn.bottomAnchor, constant: 12).isActive = true
        codeLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        let codeField = UITextField()
        codeField.leftView = paddingView
        codeField.rightView = paddingView
        codeField.leftViewMode = .always
        codeField.rightViewMode = .always
        codeField.backgroundColor = Color().grey()
        codeField.layer.cornerRadius = 10
        addNeeded(v: codeField)
        codeField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        codeField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        codeField.topAnchor.constraint(equalTo: codeLabel.bottomAnchor).isActive = true
        codeField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        
        let codeQrCode = UIImageView(image: UIImage(named: "qrCode"))
        addNeeded(v: codeQrCode)
        codeQrCode.trailingAnchor.constraint(equalTo: codeField.trailingAnchor, constant: -12).isActive = true
        codeQrCode.topAnchor.constraint(equalTo: codeField.topAnchor, constant: 10).isActive = true
        codeQrCode.bottomAnchor.constraint(equalTo: codeField.bottomAnchor, constant: -10).isActive = true
        
        let fromDateLabel = UILabel()
        fromDateLabel.text = "From"
        fromDateLabel.textColor = Color().darkGrey()
        fromDateLabel.font = fromDateLabel.font.withSize(12)
        addNeeded(v: fromDateLabel)
        fromDateLabel.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 12).isActive = true
        fromDateLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        fromDate.setTitle("Beginning", for: .normal)
        fromDate.setTitleColor(.black, for: .normal)
        fromDate.titleLabel?.font = fromDate.titleLabel?.font.withSize(15)
        fromDate.backgroundColor = Color().grey()
        fromDate.layer.cornerRadius = 10
        addNeeded(v: fromDate)
        fromDate.heightAnchor.constraint(equalToConstant: 46).isActive = true
        fromDate.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        fromDate.topAnchor.constraint(equalTo: fromDateLabel.bottomAnchor).isActive = true
        fromDate.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        fromDate.addTarget(self, action: #selector(fromDatePicker), for: .touchUpInside)
        
        let toDateLabel = UILabel()
        toDateLabel.text = "To"
        toDateLabel.textColor = Color().darkGrey()
        toDateLabel.font = toDateLabel.font.withSize(12)
        addNeeded(v: toDateLabel)
        toDateLabel.topAnchor.constraint(equalTo: fromDate.bottomAnchor, constant: 12).isActive = true
        toDateLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        toDate.setTitle("Now", for: .normal)
        toDate.setTitleColor(.black, for: .normal)
        toDate.titleLabel?.font = toDate.titleLabel?.font.withSize(15)
        toDate.backgroundColor = Color().grey()
        toDate.layer.cornerRadius = 10
        addNeeded(v: toDate)
        toDate.heightAnchor.constraint(equalToConstant: 46).isActive = true
        toDate.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        toDate.topAnchor.constraint(equalTo: toDateLabel.bottomAnchor).isActive = true
        toDate.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        toDate.addTarget(self, action: #selector(toDatePicker), for: .touchUpInside)
        
        let aHalf = UIView()
        addNeeded(v: aHalf)
        aHalf.heightAnchor.constraint(equalToConstant: 1).isActive = true
        aHalf.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        aHalf.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        let bHalf = UIView()
        addNeeded(v: bHalf)
        bHalf.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bHalf.leadingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bHalf.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        let buyingTick = UIImageView(image: UIImage(named: "checked"))
        let sellingTick = UIImageView(image: UIImage(named: "unchecked"))
        
        let buyingCheck = LabelButton()
        buyingCheck.text = "Buying"
        buyingCheck.textAlignment = .center
        addNeeded(v: buyingCheck)
        buyingCheck.topAnchor.constraint(equalTo: toDate.bottomAnchor, constant: 18).isActive = true
        buyingCheck.centerXAnchor.constraint(equalTo: aHalf.centerXAnchor).isActive = true
        buyingCheck.onClick = {
            if self.buyingFilter {
                buyingTick.image = UIImage(named: "unchecked")
                
                self.buyingFilter = false
            } else {
                buyingTick.image = UIImage(named: "checked")
                
                self.buyingFilter = true
            }
        }
        
        addNeeded(v: buyingTick)
        buyingTick.trailingAnchor.constraint(equalTo: buyingCheck.leadingAnchor, constant: -4).isActive = true
        buyingTick.centerYAnchor.constraint(equalTo: buyingCheck.centerYAnchor).isActive = true
        
        let sellingCheck = LabelButton()
        sellingCheck.text = "Selling"
        sellingCheck.textAlignment = .center
        addNeeded(v: sellingCheck)
        sellingCheck.topAnchor.constraint(equalTo: toDate.bottomAnchor, constant: 18).isActive = true
        sellingCheck.centerXAnchor.constraint(equalTo: bHalf.centerXAnchor).isActive = true
        sellingCheck.onClick = {
            if self.sellingFilter {
                sellingTick.image = UIImage(named: "unchecked")
                self.sellingFilter = false
            } else {
                sellingTick.image = UIImage(named: "checked")
                self.sellingFilter = true
            }
        }
        
        addNeeded(v: sellingTick)
        sellingTick.trailingAnchor.constraint(equalTo: sellingCheck.leadingAnchor, constant: -4).isActive = true
        sellingTick.centerYAnchor.constraint(equalTo: sellingCheck.centerYAnchor).isActive = true
        
        
        //        let addBtn = UIButton()
        //        addBtn.setTitle("Add", for: .normal)
        //        addBtn.setTitleColor(.black, for: .normal)
        //        addBtn.titleLabel?.font = addBtn.titleLabel?.font.withSize(15)
        //        addBtn.backgroundColor = Color().yellow()
        //        addBtn.layer.cornerRadius = 10
        //        addNeeded(v: addBtn)
        //        addBtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
        //        addBtn.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        //        addBtn.topAnchor.constraint(equalTo: expirationDate.bottomAnchor, constant: 24).isActive = true
        //        addBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        //        addBtn.addTarget(self, action: #selector(expirationDatePicker), for: .touchUpInside)
        //        addBtn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32).isActive = true
    }
    
    func addNeeded(v: UIView){
        v.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(v)
    }
    
    @objc func fromDatePicker(){
        datePickerView = fromDate
        createDatePicker()
    }
    @objc func toDatePicker(){
        datePickerView = toDate
        createDatePicker()
    }
    
    @objc func pickWarehouse(){
        dropDownView = warehouseBtn
        dropDownLst = ["abc", "xyz"]
        dropDownIcon = warehouseDropDownIcon
        showDropDown()
    }
    
    func createDatePicker(){
        datePicker.backgroundColor = UIColor.white
        datePicker.datePickerMode = .dateAndTime
        datePicker.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 150)
        view.addSubview(datePicker)
        
        datePickerToolbar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 50))
        datePickerToolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.onDoneButtonClick))]
        datePickerToolbar.sizeToFit()
        view.addSubview(datePickerToolbar)
    }
    
    
    @objc func onDoneButtonClick() {
        datePickerView.setTitleColor(.black, for: .normal)
        datePickerView.setTitle("\(timeFormatter.string(from: datePicker.date))", for: .normal)
        datePickerToolbar.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    @objc func pickEmployee(){
        dropDownView = employeeBtn
        dropDownLst = ["abc", "xyz"]
        dropDownIcon = employeeDropDownIcon
        showDropDown()
    }
    
    func showDropDown(){
        let frame = dropDownView.frame
        var height: CGFloat = 300
        var width: CGFloat = frame.width
        if dropDownLst.count < 7 {
            height = CGFloat(dropDownLst.count * 50)
        }
        if width < 100 {
            width = 100
        }
        if (dropDownDialog.frame.height < 10){
            dropDownDialog.reloadData()
            dropDownDialog.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height , width: width, height: 0)
            view.addSubview(dropDownDialog)
            dropDownDialog.layer.cornerRadius = 10
            dropDownDialog.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            UIView.animate(withDuration: 0.2, animations: {
                self.dropDownDialog.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height - 8, width: width, height: height)
                self.dropDownIcon.transform = CGAffineTransformMakeRotation(180 * .pi / 180)
            })
        } else{
            UIView.animate(withDuration: 0.2, animations: {
                self.dropDownDialog.frame = CGRect(x: frame.origin.x, y: frame.origin.y + frame.height, width: width, height: 0)
                self.warehouseDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
                self.employeeDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
                //                self.sellingDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
                //                self.quantityDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
            })
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownLst.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dropDownDialog.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dropDownLst[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pickedValue = dropDownLst[indexPath.row]
        let btn = dropDownView.frame
        
        if dropDownView is UIButton {
            (dropDownView as! UIButton).setTitle(pickedValue, for: .normal)
        } else if dropDownView is LabelButton{
            (dropDownView as! LabelButton).text = pickedValue
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.dropDownDialog.frame = CGRect(x: btn.origin.x, y: btn.origin.y + btn.height , width: btn.width, height: 0)
            self.warehouseDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
            self.employeeDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
            //            self.sellingDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
            //            self.quantityDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
        })
    }
    
    
}
extension String {
    func localized() -> String{
        return NSLocalizedString(self,tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
