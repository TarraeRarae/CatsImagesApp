//
//  ViewController.swift
//  CatsImagesApp
//
//  Created by TarraeRarae on 25.10.2021.
//

import UIKit

class SearchViewController: UIViewController {

    var searchTableView: UITableView = UITableView()
    var viewModel: TableViewViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navigationItem.title = "Search"
        setupTableView()
        viewModel = SearchViewViewModel()
        if let viewModel = viewModel {
            viewModel.tableView = searchTableView
            viewModel.refreshData(for: ["beng"])
        }
    }

    deinit {
        viewModel?.cancelDataTasks()
    }

    private func setupTableView() {
        searchTableView = UITableView(frame: view.bounds, style: .plain)
        searchTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        searchTableView.register(UINib(nibName: CatsTableViewCellController.Constant.nibName, bundle: nil), forCellReuseIdentifier: CatsTableViewCellController.Constant.cellID)
        searchTableView.delegate = self
        searchTableView.dataSource = self
        view.addSubview(searchTableView)
    }
}

extension SearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CatsTableViewCellController.Constant.cellID, for: indexPath) as? CatsTableViewCellController else { fatalError() }
        cell.viewModel = viewModel?.cellViewModel(forIndexPath: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewModel = viewModel else { return }
        let singleCatPhotoViewController = SingleCatPhotoViewController(cellViewModel:  viewModel.cellViewModel(forIndexPath: indexPath))
        show(singleCatPhotoViewController, sender: nil)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CatsTableViewCellController.Constant.rowHeight
    }
}

extension SearchViewController: UITableViewDelegate {

}
