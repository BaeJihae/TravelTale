//
//  TravelMemoryViewController.swift
//  TravelTale
//
//  Created by 유림 on 6/8/24.
//

import UIKit

final class TravelMemoryViewController: BaseViewController {
    
    // MARK: - properties
    private let travelMemoryView = TravelMemoryView()
    private var travels: [Travel] = [] {
        didSet {
            travelMemoryView.tableView.reloadData()
        }
    }
    
    
    // MARK: - life cycles
    override func loadView() {
        view = travelMemoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        addTemporaryData()
    }
    
    
    // MARK: - methods
    // TODO: travels 데이터 추가 함수
    override func configureStyle() {
        travelMemoryView.tableView.separatorStyle = .none
    }
    
    override func configureDelegate() {
        travelMemoryView.tableView.dataSource = self
        travelMemoryView.tableView.delegate = self
        travelMemoryView.tableView.register(TravelTableViewCell.self, forCellReuseIdentifier: TravelTableViewCell.identifier)
    }
    
    override func configureAddTarget() {
        travelMemoryView.addButtonView.button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
    }
    
    
    // MARK: - objc method
    @objc func tappedAddButton() {
        // TODO: TravelMemoryAddVC push
    }
}

// MARK: - Extensions
extension TravelMemoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as? TravelTableViewCell else { return UITableViewCell() }
        
//        cell.bind(travel: travels[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
}

extension TravelMemoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: TravelMemoryDetailVC push
//        let nextVC = TravelMemoryDetailViewController(travelData: travels[indexPath.row])
//        navigationController?.pushViewController(nextVC, animated: true)
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
    }
}
