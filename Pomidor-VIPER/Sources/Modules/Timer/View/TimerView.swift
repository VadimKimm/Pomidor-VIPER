//
//  TimerView.swift
//  Pomidor-VIPER
//
//  Created by Vadim Kim on 21.06.2022.
//

import UIKit

final class TimerView: UIView {

    weak var viewController: TimerViewController!

    //MARK: - UI Objects -

    lazy var timerLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Metric.timerLabelTextFont, weight: .thin)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5

        return label
    }()

    lazy var startPauseButton: UIButton = {
        let button = UIButton()
        var buttonConfig = UIButton.Configuration.plain()
        let imageConfig = TimerView.getButtonImageConfig()
        let image = UIImage(systemName: "play",
                            withConfiguration: imageConfig)?.withTintColor(
                                UIColor.link.withAlphaComponent(0.7),
                                renderingMode: .alwaysOriginal)

        buttonConfig.image = image

        button.configuration = buttonConfig
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    lazy var circularProgressBar: CircularProgressBarView = {
        let circularProgressBar = CircularProgressBarView(frame: .zero)
        circularProgressBar.translatesAutoresizingMaskIntoConstraints = false

        return circularProgressBar
    }()

    lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Настройки", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
//        button.layer.cornerRadius = 10
        button.backgroundColor = .darkGray

        return button
    }()

    //MARK: - Views -

    private lazy var timerStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Metric.timerStackViewSpacing
        stackView.alignment = .center

        return stackView
    }()

    //MARK: - Initial -

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .lightGray
        setupHierarchy()
        setupLayout()
    }

    //MARK: - Settings -

    private func setupHierarchy() {
        addSubview(timerStackView)
        addSubview(circularProgressBar)
        addSubview(settingsButton)

        timerStackView.addArrangedSubview(timerLabel)
        timerStackView.addArrangedSubview(startPauseButton)
    }

    private func setupLayout() {
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        settingsButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 150).isActive = true

        timerStackView.translatesAutoresizingMaskIntoConstraints = false
        timerStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        timerStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        timerStackView.heightAnchor.constraint(equalTo: widthAnchor,
                                               multiplier: Metric.timerStackViewHeightMultiplier).isActive = true

        circularProgressBar.translatesAutoresizingMaskIntoConstraints = false
        circularProgressBar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circularProgressBar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}


//MARK: - Extensions -

extension TimerView {
    static func getButtonImageConfig() -> UIImage.SymbolConfiguration {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 40, weight: .thin, scale: .default)

        return imageConfig
    }

}

extension TimerView {
    enum Metric {
        static let timerStackViewSpacing: CGFloat = 10
        static let timerLabelTextFont: CGFloat = 45

        static let parentViewWidthMultiplier: CGFloat = 2 / 3
        static let parentViewHeightMultiplier: CGFloat = 2 / 3

        static let timerStackViewHeightMultiplier: CGFloat = 2 / 5
    }
}
