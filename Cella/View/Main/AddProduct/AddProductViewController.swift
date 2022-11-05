import UIKit

class AddProductViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let scrollView = UIScrollView()
    
    let warehouseBtn = UIButton()
    let costCurrency = LabelButton()
    let costField = UITextField()
    let sellingCurrency = LabelButton()
    let sellingField = UITextField()
    let quantityCurrency = LabelButton()
    let quantityField = UITextField()
    let deliverDate = UIButton()
    let expirationDate = UIButton()
    var datePickerView = UIButton()
    let productImage = UIImageView()
    
    let datePicker = UIDatePicker()
    var datePickerToolbar = UIToolbar()
    let timeFormatter = DateFormatter()
    var imagePicker = UIImagePickerController()
    
    let dropDownDialog = UITableView()
    var dropDownIcon = UIImageView()
    var dropDownView = UIView()
    var dropDownLst = [String]()
    
    let warehouseDropDownIcon = UIImageView(image: UIImage(named: "downArrow"))
    let costDropDownIcon = UIImageView(image: UIImage(named: "downArrow"))
    let sellingDropDownIcon = UIImageView(image: UIImage(named: "downArrow"))
    let quantityDropDownIcon = UIImageView(image: UIImage(named: "downArrow"))
    let productImageIcon = UIImageView(image: UIImage(named: "product"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        drawUI()
        
        costField.delegate = self
        sellingField.delegate = self
        quantityField.delegate = self
        
        dropDownDialog.delegate = self
        dropDownDialog.dataSource = self
        dropDownDialog.register(DropDownCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func drawUI(){
        view.backgroundColor = .white
        let layout = view.layoutMarginsGuide
        var paddingView: UIView
        dropDownDialog.backgroundColor = Color().grey()
        
        let titleLabel = UILabel()
        titleLabel.text = "Add product"
        titleLabel.font = titleLabel.font.withSize(24)
        addNeeded(v: titleLabel, parent: scrollView)
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        productImage.backgroundColor = Color().grey()
        productImage.layer.cornerRadius = 10
        productImage.clipsToBounds = true
        addNeeded(v: productImage, parent: scrollView)
        productImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        productImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        productImage.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        productImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        let productTapGesture = UITapGestureRecognizer(target: self, action: #selector(pickImage))
        productImage.isUserInteractionEnabled = true
        productImage.addGestureRecognizer(productTapGesture)
        
        addNeeded(v: productImageIcon, parent: scrollView)
        productImageIcon.widthAnchor.constraint(equalToConstant: 42).isActive = true
        productImageIcon.heightAnchor.constraint(equalToConstant: 28).isActive = true
        productImageIcon.leadingAnchor.constraint(equalTo: productImage.leadingAnchor, constant: 14).isActive = true
        productImageIcon.topAnchor.constraint(equalTo: productImage.topAnchor, constant: 21).isActive = true
        
        let productImageAdd = UIImageView(image: UIImage(named: "circlePlus"))
        addNeeded(v: productImageAdd, parent: scrollView)
        productImageAdd.widthAnchor.constraint(equalToConstant: 24).isActive = true
        productImageAdd.heightAnchor.constraint(equalToConstant: 24).isActive = true
        productImageAdd.trailingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 6).isActive = true
        productImageAdd.bottomAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 6).isActive = true
        
        let warehouseLabel = UILabel()
        warehouseLabel.text = "Warehouse"
        warehouseLabel.textColor = Color().darkGrey()
        warehouseLabel.font = warehouseLabel.font.withSize(12)
        addNeeded(v: warehouseLabel, parent: scrollView)
        warehouseLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 12).isActive = true
        warehouseLabel.topAnchor.constraint(equalTo: productImage.topAnchor).isActive = true
        
        warehouseBtn.backgroundColor = Color().grey()
        warehouseBtn.setTitle("Select warehouse", for: .normal)
        warehouseBtn.titleLabel?.font = warehouseBtn.titleLabel?.font.withSize(17)
        warehouseBtn.contentHorizontalAlignment = .left
        warehouseBtn.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 20.0)
        warehouseBtn.setTitleColor(.black, for: .normal)
        warehouseBtn.layer.cornerRadius = 10
        addNeeded(v: warehouseBtn, parent: scrollView)
        warehouseBtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
        warehouseBtn.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 12).isActive = true
        warehouseBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        warehouseBtn.topAnchor.constraint(equalTo: warehouseLabel.bottomAnchor).isActive = true
        warehouseBtn.addTarget(self, action: #selector(pickWarehouse), for: .touchUpInside)
        
        addNeeded(v: warehouseDropDownIcon, parent: scrollView)
        warehouseDropDownIcon.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -12).isActive = true
        warehouseDropDownIcon.topAnchor.constraint(equalTo: warehouseBtn.topAnchor).isActive = true
        warehouseDropDownIcon.bottomAnchor.constraint(equalTo: warehouseBtn.bottomAnchor).isActive = true
        warehouseDropDownIcon.contentMode = .center
        
        let codeLabel = UILabel()
        codeLabel.text = "Code"
        codeLabel.textColor = Color().darkGrey()
        codeLabel.font = codeLabel.font.withSize(12)
        addNeeded(v: codeLabel, parent: scrollView)
        codeLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 12).isActive = true
        codeLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        let codeField = UITextField()
        codeField.leftView = paddingView
        codeField.rightView = paddingView
        codeField.leftViewMode = .always
        codeField.rightViewMode = .always
        codeField.backgroundColor = Color().grey()
        codeField.layer.cornerRadius = 10
        addNeeded(v: codeField, parent: scrollView)
        codeField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        codeField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        codeField.topAnchor.constraint(equalTo: codeLabel.bottomAnchor).isActive = true
        codeField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        
        let codeQrCode = UIImageView(image: UIImage(named: "qrCode"))
        addNeeded(v: codeQrCode, parent: scrollView)
        codeQrCode.trailingAnchor.constraint(equalTo: codeField.trailingAnchor, constant: -12).isActive = true
        codeQrCode.topAnchor.constraint(equalTo: codeField.topAnchor, constant: 10).isActive = true
        codeQrCode.bottomAnchor.constraint(equalTo: codeField.bottomAnchor, constant: -10).isActive = true
        
        let nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.textColor = Color().darkGrey()
        nameLabel.font = codeLabel.font.withSize(12)
        addNeeded(v: nameLabel, parent: scrollView)
        nameLabel.topAnchor.constraint(equalTo: codeField.bottomAnchor, constant: 12).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        let nameField = UITextField()
        nameField.backgroundColor = Color().grey()
        nameField.layer.cornerRadius = 10
        nameField.leftView = paddingView
        nameField.rightView = paddingView
        nameField.leftViewMode = .always
        nameField.rightViewMode = .always
        addNeeded(v: nameField, parent: scrollView)
        nameField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        nameField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        nameField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        
        let costLabel = UILabel()
        costLabel.text = "Cost price"
        costLabel.textColor = Color().darkGrey()
        costLabel.font = codeLabel.font.withSize(12)
        addNeeded(v: costLabel, parent: scrollView)
        costLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 12).isActive = true
        costLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        costField.backgroundColor = Color().grey()
        costField.layer.cornerRadius = 10
        costField.leftView = paddingView
        costField.rightView = paddingView
        costField.leftViewMode = .always
        costField.rightViewMode = .always
        costField.keyboardType = .decimalPad
        addNeeded(v: costField, parent: scrollView)
        costField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        costField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        costField.topAnchor.constraint(equalTo: costLabel.bottomAnchor).isActive = true
        costField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        
        costCurrency.text = "som"
        costCurrency.textAlignment = .left
        addNeeded(v: costCurrency, parent: scrollView)
        costCurrency.widthAnchor.constraint(equalToConstant: 80).isActive = true
        costCurrency.trailingAnchor.constraint(equalTo: costField.trailingAnchor, constant: -34).isActive = true
        costCurrency.topAnchor.constraint(equalTo: costField.topAnchor).isActive = true
        costCurrency.bottomAnchor.constraint(equalTo: costField.bottomAnchor, constant: -2).isActive = true
        costCurrency.onClick = {
            self.pickCostCurrency()
        }
        
        addNeeded(v: costDropDownIcon, parent: scrollView)
        costDropDownIcon.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -12).isActive = true
        costDropDownIcon.topAnchor.constraint(equalTo: costField.topAnchor).isActive = true
        costDropDownIcon.bottomAnchor.constraint(equalTo: costField.bottomAnchor).isActive = true
        costDropDownIcon.contentMode = .center
        
        let sellingLabel = UILabel()
        sellingLabel.text = "Selling price"
        sellingLabel.textColor = Color().darkGrey()
        sellingLabel.font = codeLabel.font.withSize(12)
        addNeeded(v: sellingLabel, parent: scrollView)
        sellingLabel.topAnchor.constraint(equalTo: costField.bottomAnchor, constant: 12).isActive = true
        sellingLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        sellingField.backgroundColor = Color().grey()
        sellingField.layer.cornerRadius = 10
        sellingField.leftView = paddingView
        sellingField.rightView = paddingView
        sellingField.leftViewMode = .always
        sellingField.rightViewMode = .always
        sellingField.keyboardType = .decimalPad
        addNeeded(v: sellingField, parent: scrollView)
        sellingField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        sellingField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        sellingField.topAnchor.constraint(equalTo: sellingLabel.bottomAnchor).isActive = true
        sellingField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        
        sellingCurrency.text = "som"
        sellingCurrency.textAlignment = .left
        addNeeded(v: sellingCurrency, parent: scrollView)
        sellingCurrency.widthAnchor.constraint(equalToConstant: 80).isActive = true
        sellingCurrency.trailingAnchor.constraint(equalTo: sellingField.trailingAnchor, constant: -34).isActive = true
        sellingCurrency.topAnchor.constraint(equalTo: sellingField.topAnchor).isActive = true
        sellingCurrency.bottomAnchor.constraint(equalTo: sellingField.bottomAnchor, constant: -2).isActive = true
        sellingCurrency.onClick = {
            self.pickSellingCurrency()
        }
        
        addNeeded(v: sellingDropDownIcon, parent: scrollView)
        sellingDropDownIcon.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -12).isActive = true
        sellingDropDownIcon.topAnchor.constraint(equalTo: sellingField.topAnchor).isActive = true
        sellingDropDownIcon.bottomAnchor.constraint(equalTo: sellingField.bottomAnchor).isActive = true
        sellingDropDownIcon.contentMode = .center
        
        let quantityLabel = UILabel()
        quantityLabel.text = "quantity price"
        quantityLabel.textColor = Color().darkGrey()
        quantityLabel.font = codeLabel.font.withSize(12)
        addNeeded(v: quantityLabel, parent: scrollView)
        quantityLabel.topAnchor.constraint(equalTo: sellingField.bottomAnchor, constant: 12).isActive = true
        quantityLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        quantityField.backgroundColor = Color().grey()
        quantityField.layer.cornerRadius = 10
        quantityField.leftView = paddingView
        quantityField.rightView = paddingView
        quantityField.leftViewMode = .always
        quantityField.rightViewMode = .always
        quantityField.keyboardType = .decimalPad
        addNeeded(v: quantityField, parent: scrollView)
        quantityField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        quantityField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        quantityField.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor).isActive = true
        quantityField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        
        quantityCurrency.text = "piece"
        quantityCurrency.textAlignment = .left
        addNeeded(v: quantityCurrency, parent: scrollView)
        quantityCurrency.widthAnchor.constraint(equalToConstant: 80).isActive = true
        quantityCurrency.trailingAnchor.constraint(equalTo: quantityField.trailingAnchor, constant: -34).isActive = true
        quantityCurrency.topAnchor.constraint(equalTo: quantityField.topAnchor).isActive = true
        quantityCurrency.bottomAnchor.constraint(equalTo: quantityField.bottomAnchor, constant: -2).isActive = true
        quantityCurrency.onClick = {
            self.pickQuantityType()
        }
        
        addNeeded(v: quantityDropDownIcon, parent: scrollView)
        quantityDropDownIcon.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -12).isActive = true
        quantityDropDownIcon.topAnchor.constraint(equalTo: quantityField.topAnchor).isActive = true
        quantityDropDownIcon.bottomAnchor.constraint(equalTo: quantityField.bottomAnchor).isActive = true
        quantityDropDownIcon.contentMode = .center
        
        let supplierLabel = UILabel()
        supplierLabel.text = "Supplier"
        supplierLabel.textColor = Color().darkGrey()
        supplierLabel.font = supplierLabel.font.withSize(12)
        addNeeded(v: supplierLabel, parent: scrollView)
        supplierLabel.topAnchor.constraint(equalTo: quantityField.bottomAnchor, constant: 12).isActive = true
        supplierLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 20))
        let supplierField = UITextField()
        supplierField.backgroundColor = Color().grey()
        supplierField.layer.cornerRadius = 10
        supplierField.leftView = paddingView
        supplierField.rightView = paddingView
        supplierField.leftViewMode = .always
        supplierField.rightViewMode = .always
        addNeeded(v: supplierField, parent: scrollView)
        supplierField.heightAnchor.constraint(equalToConstant: 46).isActive = true
        supplierField.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        supplierField.topAnchor.constraint(equalTo: supplierLabel.bottomAnchor).isActive = true
        supplierField.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        
        let deliverDateLabel = UILabel()
        deliverDateLabel.text = "Deliver date"
        deliverDateLabel.textColor = Color().darkGrey()
        deliverDateLabel.font = deliverDateLabel.font.withSize(12)
        addNeeded(v: deliverDateLabel, parent: scrollView)
        deliverDateLabel.topAnchor.constraint(equalTo: supplierField.bottomAnchor, constant: 12).isActive = true
        deliverDateLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        let currentDate = Date()
        timeFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        deliverDate.setTitle("\(timeFormatter.string(from: currentDate))", for: .normal)
        deliverDate.setTitleColor(.black, for: .normal)
        deliverDate.titleLabel?.font = deliverDate.titleLabel?.font.withSize(15)
        deliverDate.backgroundColor = Color().grey()
        deliverDate.layer.cornerRadius = 10
        addNeeded(v: deliverDate, parent: scrollView)
        deliverDate.heightAnchor.constraint(equalToConstant: 46).isActive = true
        deliverDate.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        deliverDate.topAnchor.constraint(equalTo: deliverDateLabel.bottomAnchor).isActive = true
        deliverDate.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        deliverDate.addTarget(self, action: #selector(deliverDatePicker), for: .touchUpInside)
        
        let expirationDateLabel = UILabel()
        expirationDateLabel.text = "Expiration date"
        expirationDateLabel.textColor = Color().darkGrey()
        expirationDateLabel.font = expirationDateLabel.font.withSize(12)
        addNeeded(v: expirationDateLabel, parent: scrollView)
        expirationDateLabel.topAnchor.constraint(equalTo: deliverDate.bottomAnchor, constant: 12).isActive = true
        expirationDateLabel.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        
        expirationDate.setTitle("Not necessary", for: .normal)
        expirationDate.setTitleColor(.gray, for: .normal)
        expirationDate.titleLabel?.font = expirationDate.titleLabel?.font.withSize(15)
        expirationDate.backgroundColor = Color().grey()
        expirationDate.layer.cornerRadius = 10
        addNeeded(v: expirationDate, parent: scrollView)
        expirationDate.heightAnchor.constraint(equalToConstant: 46).isActive = true
        expirationDate.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        expirationDate.topAnchor.constraint(equalTo: expirationDateLabel.bottomAnchor).isActive = true
        expirationDate.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        expirationDate.addTarget(self, action: #selector(expirationDatePicker), for: .touchUpInside)
        
        let addBtn = UIButton()
        addBtn.setTitle("Add", for: .normal)
        addBtn.setTitleColor(.black, for: .normal)
        addBtn.titleLabel?.font = addBtn.titleLabel?.font.withSize(15)
        addBtn.backgroundColor = Color().yellow()
        addBtn.layer.cornerRadius = 10
        addNeeded(v: addBtn, parent: scrollView)
        addBtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
        addBtn.leadingAnchor.constraint(equalTo: layout.leadingAnchor).isActive = true
        addBtn.topAnchor.constraint(equalTo: expirationDate.bottomAnchor, constant: 24).isActive = true
        addBtn.trailingAnchor.constraint(equalTo: layout.trailingAnchor).isActive = true
        addBtn.addTarget(self, action: #selector(expirationDatePicker), for: .touchUpInside)
        addBtn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -32).isActive = true
        
    }
    
    @objc func pickImage(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            productImage.image = image
            productImageIcon.isHidden = true
        }
    }
    
    @objc func deliverDatePicker(){
        datePickerView = deliverDate
        createDatePicker()
    }
    
    @objc func expirationDatePicker(){
        datePickerView = expirationDate
        createDatePicker()
    }
    
    func createDatePicker(){
        datePicker.backgroundColor = UIColor.white
        datePicker.datePickerMode = .dateAndTime
        datePicker.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 150)
        self.view.addSubview(datePicker)
        
        datePickerToolbar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 200, width: UIScreen.main.bounds.size.width, height: 50))
        datePickerToolbar.items = [UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.onDoneButtonClick))]
        datePickerToolbar.sizeToFit()
        self.view.addSubview(datePickerToolbar)
    }
    
    @objc func onDoneButtonClick() {
        datePickerView.setTitleColor(.black, for: .normal)
        datePickerView.setTitle("\(timeFormatter.string(from: datePicker.date))", for: .normal)
        datePickerToolbar.removeFromSuperview()
        datePicker.removeFromSuperview()
    }
    
    func addNeeded(v: UIView, parent: UIView? = nil){
        v.translatesAutoresizingMaskIntoConstraints = false
        if parent == nil{
            view.addSubview(v)
        } else {
            parent?.addSubview(v)
        }
    }
    
    @objc func pickWarehouse(){
        dropDownView = warehouseBtn
        dropDownLst = ["abc", "xyz"]
        dropDownIcon = warehouseDropDownIcon
        showDropDown()
    }
    @objc func pickCostCurrency(){
        dropDownView = costCurrency
        dropDownLst = ["rubel", "som"]
        dropDownIcon = costDropDownIcon
        showDropDown()
    }
    @objc func pickSellingCurrency(){
        dropDownView = sellingCurrency
        dropDownLst = ["rubel", "som"]
        dropDownIcon = sellingDropDownIcon
        showDropDown()
    }
    @objc func pickQuantityType(){
        dropDownView = quantityCurrency
        dropDownLst = ["piece", "bag"]
        dropDownIcon = quantityDropDownIcon
        showDropDown()
    }
    
    func setupScrollView(){
        addNeeded(v: scrollView)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
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
            scrollView.addSubview(dropDownDialog)
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
                self.costDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
                self.sellingDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
                self.quantityDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
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
            self.costDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
            self.sellingDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
            self.quantityDropDownIcon.transform = CGAffineTransformMakeRotation(0 * .pi / 180)
        })
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "fr-FR")                    // Adapt to your case
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = NumberFormatter.Style.decimal
        formatter.maximumFractionDigits = 6
        formatter.decimalSeparator = "."                                  // Adapt to your case
        formatter.groupingSeparator = " "                                 // Adapt to your case
        
        let completeString = textField.text!.replacingOccurrences(of: formatter.groupingSeparator, with: "") + string
        
        var backSpace = false
        
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if (isBackSpace == -92) {
                backSpace = true
            }
        }
        if string == "" && backSpace {
            return true
        }
        if string == "-" && textField.text! == "" {
            return true
        }
        
        guard let value = Double(completeString) else { return false }
        
        let formattedNumber = formatter.string(from: NSNumber(value: value)) ?? ""
        if formattedNumber.count > 13{
            return false
        }
        textField.text = formattedNumber
        return string == formatter.decimalSeparator
    }
}
