//
//  MainViewController.swift
//  imageObserver
//
//  Created by Artyom Amankeldiev on 12.03.2022.
//

import UIKit

class MainViewController: UIViewController{
    
    var presenter: MainViewOutput?
    var cells: MainViewModel?
    private lazy var footer = FooterView()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.register(MainViewControllerTableViewCell.self, forCellReuseIdentifier: MainViewControllerTableViewCell.reuseId)
        table.contentInset.bottom = 20
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewLoaded()
        setupView()
        
//        HUD.show(.labeledProgress(title: "Загрузка", subtitle: "в процессе..."), onView: self.view)
    }
    
    private func setupView() {
        
        navigationItem.title = "Image Observer"
        tableView.tableFooterView = footer
        view.backgroundColor = .white
        view.addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y > scrollView.contentSize.height / 1.1 {
//            footer.showLoader()
//            sleep(10)
//            presenter?.getNextImages()
//        }
//    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > scrollView.contentSize.height / 1.1 {
            footer.showLoader()
            presenter?.getNextImages()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
    }
}

extension MainViewController: MainViewInput {
    
    
    func presentDetailViewController(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    func updateTable() {
        cells = presenter?.mainViewModel
        tableView.reloadData()
        
        
//        HUD.show(.labeledSuccess(title: "Загрузка", subtitle: "завершена"), onView: self.view)
//        HUD.hide(afterDelay: 1, completion: nil)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells?.cells.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewControllerTableViewCell.reuseId, for: indexPath) as! MainViewControllerTableViewCell
        cell.setupView()
        let model = cells?.cells[indexPath.row]
        cell.fillContent(model: model)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 430
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        presenter?.configureDetailViewController(cellIndex: indexPath.row)
    }
}
