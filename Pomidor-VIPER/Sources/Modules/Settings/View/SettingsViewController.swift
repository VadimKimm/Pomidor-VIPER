//
//  SettingsView.swift
//  Pomidor-VIPER
//
//  Created by t h a . m a m e rozz on 21.06.22.
//

import UIKit

// MARK: - View protocols
protocol SettingsViewInputProtocol: AnyObject {
    func changeDuration(_ duration: String)
}

protocol SettingsViewOutputProtocol: AnyObject {
    init(view: SettingsViewInputProtocol)
    func didTapSaveNewDurationButton()
    func tapChoseShortDuration()
    func tapChoseLongDuration()
}

//MARK: - Main class
class SettingsViewController: UIViewController {

    //    MARK: - Properties
    var presenter: SettingsViewOutputProtocol!
    private let assembly: AssemblySettingsInputs = AssemblySettings()

//    MARK: - Views
    private var parentStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Metrics.parentStackViewSpacing
        stackView.distribution = .fillEqually

        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()

    private let mainLabel: UILabel = {
        let label = UILabel()

        label.text = "Выберите режим таймера"

        label.numberOfLines = 3
        label.textAlignment = .center

        label.translatesAutoresizingMaskIntoConstraints = false


        return label
    }()

    private let shortDurationModeActivationButton: SelectedButton = {
        let button = SelectedButton()

        button.setTitle(Strings.shortModeButtonTitle, for: .normal)
        button.setTitleColor(Colors.buttonTitleColor, for: .normal)
        button.setTitleColor(Colors.buttonTitleColor, for: .selected)


        button.titleLabel?.font = .systemFont(ofSize: Metrics.buttonFontSize, weight: .medium)
        button.backgroundColor = Colors.buttonBackgroundColor

        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metrics.buttonHeight / 2

        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false

        return button

    }()

    private let longDurationModeActivationButton: SelectedButton = {
        let button = SelectedButton()

        button.setTitle(Strings.longModeButtonTitle, for: .normal)
        button.setTitleColor(Colors.buttonTitleColor, for: .normal)
        button.setTitleShadowColor(.clear, for: .selected)

        button.titleLabel?.font = .systemFont(ofSize: Metrics.buttonFontSize, weight: .medium)
        button.backgroundColor = Colors.buttonBackgroundColor

        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metrics.buttonHeight / 2

        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false


        return button
    }()

    private let saveNewDurationButton: UIButton = {
        let button = UIButton()

        button.setTitle(Strings.newDuraionButtonTitle, for: .normal)
        button.setTitleColor(Colors.buttonTitleColor, for: .normal)
        button.setTitleShadowColor(.clear, for: .selected)


        button.titleLabel?.font = .systemFont(ofSize: Metrics.buttonFontSize, weight: .medium)
        button.backgroundColor = Colors.saveNewDurationBackgroundColor

        button.layer.masksToBounds = true
        button.layer.cornerRadius = Metrics.buttonHeight / 2

        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

//    MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        assembly.assemblyModule(with: self)

        setupHierarchy()
        setupLayout()
        setupView()

        shortDurationModeActivationButton.addTarget(self, action: #selector(choseShortDuration), for: .touchUpInside)
        longDurationModeActivationButton.addTarget(self, action: #selector(choseLongDuration), for: .touchUpInside)
        saveNewDurationButton.addTarget(self, action: #selector(saveNewDuration), for: .touchUpInside)
    }
//    MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(parentStackView)
        view.addSubview(mainLabel)

        parentStackView.addArrangedSubview(shortDurationModeActivationButton)
        parentStackView.addArrangedSubview(longDurationModeActivationButton)
        parentStackView.addArrangedSubview(saveNewDurationButton)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.bottomAnchor.constraint(equalTo: parentStackView.topAnchor, constant: -50)
        ])

        NSLayoutConstraint.activate([
            parentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            parentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            parentStackView.heightAnchor.constraint(equalToConstant: Metrics.parentStackViewHeight),
            parentStackView.widthAnchor.constraint(equalToConstant: Metrics.buttonHeight)
        ])

    }

    private func setupView() {
        view.backgroundColor = Colors.backgroundColor
    }
//    MARK: - Functions
    @objc func saveNewDuration() {
        presenter.didTapSaveNewDurationButton()
    }

    @objc func choseShortDuration() {
        presenter.tapChoseShortDuration()

        shortDurationModeActivationButton.isSelected = true
        longDurationModeActivationButton.isSelected = false
    }

    @objc func choseLongDuration() {
        presenter.tapChoseLongDuration()

        shortDurationModeActivationButton.isSelected = false
        longDurationModeActivationButton.isSelected = true
    }

}

// MARK: - Extension
extension SettingsViewController: SettingsViewInputProtocol {
    func changeDuration(_ duration: String) {
        mainLabel.text = duration
    }
}

extension SettingsViewController {
    enum Metrics {
        static let parentStackViewSpacing: CGFloat = 15
        static let parentStackViewHeight: CGFloat = 430

        static let buttonFontSize: CGFloat = 20
        static let buttonHeight: CGFloat = 135

    }

    enum Strings {
        static let shortModeButtonTitle = "Режим #1"
        static let longModeButtonTitle = "Режим #2"
        static let newDuraionButtonTitle = "Назад"

    }

    enum Colors {
        static let backgroundColor = UIColor.lightGray

        static let buttonTitleColor = UIColor.white
        static let buttonBackgroundColor = UIColor.link.withAlphaComponent(0.7)

        static let saveNewDurationBackgroundColor = UIColor.darkGray

    }
}
