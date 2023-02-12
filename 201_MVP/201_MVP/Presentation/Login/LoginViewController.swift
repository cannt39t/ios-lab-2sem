//
//  LoginViewController.swift
//  201_MVP
//
//  Created by Илья Казначеев on 12.02.2023.
//

import UIKit


@MainActor
class LoginViewController: UIViewController {
    
    @IBOutlet private var loginField: UITextField!
    @IBOutlet private var passwordField: UITextField!
    @IBOutlet private var activityIndicatorView: UIActivityIndicatorView!
    
    var presenter: LoginPresenter!
    
    
    func showLoader() {
        view.backgroundColor = .systemGray
        activityIndicatorView.startAnimating()
    }
    
    func hideLoader() {
        view.backgroundColor = .white
        activityIndicatorView.stopAnimating ()
    }
    
    func show(error: Error) {
        let alertController = UIAlertController(title: "OOOPS", message: "Something went wrong: \(error)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }
    
    @IBAction private func login() {
        guard let login = loginField.text, let password = passwordField.text else { return }
        presenter.logIn(login: login, password: password)
    }
}
