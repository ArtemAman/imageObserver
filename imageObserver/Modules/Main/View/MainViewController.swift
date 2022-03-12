//
//  MainViewController.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit

class MainViewController: UIViewController{
    
    var presenter: MainViewOutput?
//    var cells: MainTableViewModel?
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
//        table.separatorStyle = .none
        table.register(MainViewControllerTableViewCell.self, forCellReuseIdentifier: MainViewControllerTableViewCell.reuseId)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
        setupView()
        
//        HUD.show(.labeledProgress(title: "Загрузка", subtitle: "в процессе..."), onView: self.view)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension MainViewController: MainViewInput {
    
    
    func presentDetailViewController(viewController: UIViewController) {
//        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    func updateTable() {
//        firstCollection.cells = presenter?.firstViewModel
//        firstCollection.reloadData()
//
//        secondCollection.cells = presenter?.secondViewModel
//        secondCollection.reloadData()
//
//        thirdCollection.cells = presenter?.thirdViewModel
//        thirdCollection.reloadData()
//
//        fourthCollection.cells = presenter?.fourthViewModel
//        fourthCollection.reloadData()
//
//        sixthCollection.cells = presenter?.sixthViewModel
//        sixthCollection.reloadData()
//
//        seventhCollection.cells = presenter?.thirdViewModel
//        seventhCollection.reloadData()
        
//        HUD.show(.labeledSuccess(title: "Загрузка", subtitle: "завершена"), onView: self.view)
//        HUD.hide(afterDelay: 1, completion: nil)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
//        cells?.collections.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewControllerTableViewCell.reuseId, for: indexPath) as! MainViewControllerTableViewCell
        cell.setupView()
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        guard let cellSize = cells?.heights[indexPath.row] else { return 0 }
//        return cellSize
        
        return 50
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }

}


//extension MainViewController: DetailCollectionViewCellPressDelegate {
//
//    func makeDetailVc(index: Int) {
//        presenter?.configureDetailRecipeViewController(cellIndex: index)
//    }
//}
//
//extension MainViewController: RequestCollectionViewCellPressDelegate {
//
//    func makeDetailVc(requestString: String?, requestingType: Int) {
//
//        presenter?.configureDetailTableViewController(requestingString: requestString, requestType: requestingType)
//    }
//}

