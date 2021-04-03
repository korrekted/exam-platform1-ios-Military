//
//  OSlide9View.swift
//  Nursing
//
//  Created by Andrey Chernyshev on 24.01.2021.
//

import UIKit

final class OSlideGoalsView: OSlideView {
    lazy var titleLabel = makeTitleLabel()
    lazy var tag1 = makeTag(title: "Onboarding.SlideGoals.Tag1", tag: 1)
    lazy var tag2 = makeTag(title: "Onboarding.SlideGoals.Tag2", tag: 2)
    lazy var tag3 = makeTag(title: "Onboarding.SlideGoals.Tag3", tag: 3)
    lazy var tag4 = makeTag(title: "Onboarding.SlideGoals.Tag4", tag: 4)
    lazy var tag5 = makeTag(title: "Onboarding.SlideGoals.Tag5", tag: 5)
    lazy var button = makeButton()
    
    override init(step: OnboardingView.Step) {
        super.init(step: step)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension OSlideGoalsView {
    @objc
    func selected(tapGesture: UITapGestureRecognizer) {
        guard let tagView = tapGesture.view as? OSlideGoalsTagView else {
            return
        }
        
        tagView.isSelected = !tagView.isSelected
        
        SDKStorage.shared
            .amplitudeManager
            .logEvent(name: "Improve Tap", parameters: [:])
    }
}

// MARK: Make constraints
private extension OSlideGoalsView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17.scale),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17.scale),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 134.scale : 70.scale)
        ])
//        83
        NSLayoutConstraint.activate([
            tag1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.scale),
            tag1.widthAnchor.constraint(equalToConstant: 122.scale),
            tag1.heightAnchor.constraint(equalToConstant: 122.scale),
            tag1.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 298.scale : 215.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 137.scale),
            tag2.widthAnchor.constraint(equalToConstant: 146.scale),
            tag2.heightAnchor.constraint(equalToConstant: 146.scale),
            tag2.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 235.scale : 152.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 83.scale),
            tag3.widthAnchor.constraint(equalToConstant: 138.scale),
            tag3.heightAnchor.constraint(equalToConstant: 138.scale),
            tag3.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 411.scale : 328.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 225.scale),
            tag4.widthAnchor.constraint(equalToConstant: 131.scale),
            tag4.heightAnchor.constraint(equalToConstant: 131.scale),
            tag4.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 369.scale : 286.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag5.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 202.scale),
            tag5.widthAnchor.constraint(equalToConstant: 121.scale),
            tag5.heightAnchor.constraint(equalToConstant: 121.scale),
            tag5.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 512.scale : 429.scale)
        ])
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26.scale),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26.scale),
            button.heightAnchor.constraint(equalToConstant: 60.scale),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ScreenSize.isIphoneXFamily ? -70.scale : -30.scale)
        ])
    }
}

// MARK: Lazy initialization
private extension OSlideGoalsView {
    func makeTitleLabel() -> UILabel {
        let attrs = TextAttributes()
            .textColor(UIColor.black)
            .font(Fonts.SFProRounded.bold(size: 27.scale))
            .lineHeight(32.scale)
            .textAlignment(.center)
        
        let view = UILabel()
        view.numberOfLines = 0
        view.attributedText = "Onboarding.SlideGoals.Title".localized.attributed(with: attrs)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTag(title: String, tag: Int) -> OSlideGoalsTagView {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selected(tapGesture:)))
        
        let view = OSlideGoalsTagView()
        view.tag = tag
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        view.isSelected = false
        view.label.text = title.localized
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeButton() -> UIButton {
        let attrs = TextAttributes()
            .textColor(UIColor.white)
            .font(Fonts.SFProRounded.semiBold(size: 20.scale))
            .lineHeight(23.scale)
            .textAlignment(.center)
        
        let view = UIButton()
        view.backgroundColor = UIColor(integralRed: 141, green: 169, blue: 132)
        view.layer.cornerRadius = 16.scale
        view.setAttributedTitle("Onboarding.Proceed".localized.attributed(with: attrs), for: .normal)
        view.addTarget(self, action: #selector(onNext), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
