//
//  TravelAddViewController2.swift
//  TravelTale
//
//  Created by Kinam on 6/6/24.
//

import UIKit
import SnapKit

final class ScheduleCreateViewController: BaseViewController {
    // MARK: - properties
    let scheduleCreateView = ScheduleCreateView().then {
        $0.memoTV.text = "메세지를 입력하세요"
        $0.memoTV.textColor = .lightGray
    }
    
    // MARK: - life cycles
    override func loadView() {
        super.loadView()
        view = scheduleCreateView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStyle()
        configureDelegate()
        configureAddTarget()
        bind()
        configureNavigationBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scheduleCreateView.startLoadingAnimation()
    }
    
    // MARK: - methods
    override func configureStyle() { }
    
    override func configureDelegate() { }
    
    override func configureAddTarget() { }
    
    override func bind() { }
    
    private func configureNavigationBar() {
        navigationItem.title = "내 여행에 추가"
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(handleBackButton))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.oaGothic(size: 18, weight: .heavy),
                NSAttributedString.Key.foregroundColor: UIColor.black
            ]
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    
    @objc private func handleBackButton() {
            navigationController?.popViewController(animated: true)
        }
    
//    @objc private func
}
// MARK: - extensions
extension ScheduleCreateViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "메세지를 입력하세요"
            textView.textColor = UIColor.lightGray
        }
    }
}
