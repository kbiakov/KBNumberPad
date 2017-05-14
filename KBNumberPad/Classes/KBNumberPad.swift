//
//  KBNumberPad.swift
//  Pods
//
//  Created by Kirill Biakov on 01/21/2017.
//  Copyright (c) 2017 Kirill Biakov. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

// MARK: - Delegate

public protocol KBNumberPadDelegate {
    func onNumberClicked(numberPad: KBNumberPad, number: Int);
    func onDoneClicked(numberPad: KBNumberPad);
    func onClearClicked(numberPad: KBNumberPad);
}

// MARK: - View

public class KBNumberPad: UIView {
    
    private static let nibName = "KBNumberPad"
    private static let clearSymbolIconName = "ClearSymbolIcon"
    private static let clearSymbolFilledIconName = "ClearSymbolFilledIcon"
    
    private static let estimatedWidth = Int(UIScreen.main.bounds.width)
    private static let estimatedHeight = 250
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var doneButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    
    public var delegate: KBNumberPadDelegate?
    
    // MARK: - Init
    
    convenience init() {
        self.init(frame: KBNumberPad.defaultRect())
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupViewFromXib()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViewFromXib()
    }
    
    deinit {
        delegate = nil
    }
    
    private func setupViewFromXib() {
        let nib = UINib(nibName: KBNumberPad.nibName, bundle: bundle())
            .instantiate(withOwner: self, options: nil)
        
        let view = nib.first as! UIView
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
        containerView.snp.makeConstraints { make -> Void in
            make.edges.equalTo(self)
        }
    }
    
    fileprivate func loadIcon(name: String) -> UIImage? {
        let image = UIImage(named: name, in: bundle(), compatibleWith: nil)
        let colorable = UIImageRenderingMode.alwaysTemplate
        return image?.withRenderingMode(colorable)
    }
    
    private static func defaultRect() -> CGRect {
        return CGRect(x: 0,
                      y: 0,
                      width: KBNumberPad.estimatedWidth,
                      height: KBNumberPad.estimatedHeight)
    }
    
    private func bundle() -> Bundle {
        return Bundle(for: type(of: self))
    }
    
    // MARK: - Public methods
    
    public func setDelimiterColor(_ color: UIColor) {
        containerView.backgroundColor = color
    }
    
    public func setButtonsColor(_ color: UIColor) {
        setNumberButtonsColor(color)
        setDoneButtonColor(color)
        setClearButtonColor(color)
    }
    
    public func setButtonsBackgroundColor(_ color: UIColor) {
        [numberButtons, [doneButton, clearButton]].joined().forEach {
            $0.backgroundColor = color
        }
    }
    
    // - Number buttons
    
    public func setNumberButtonsColor(_ color: UIColor) {
        numberButtons.forEach {
            $0.setTitleColor(color, for: UIControlState.normal)
        }
    }
    
    public func setNumberButtonsFont(_ font: UIFont) {
        numberButtons.forEach {
            $0.titleLabel?.font = font
        }
    }
    
    // - Done button
    
    public func setDoneButtonColor(_ color: UIColor) {
        doneButton.setTitleColor(color, for: UIControlState.normal)
    }
    
    public func setDoneButtonFont(_ font: UIFont) {
        doneButton.titleLabel?.font = font
    }
    
    public func setDoneButtonTitle(_ title: String) {
        doneButton.titleLabel?.text = title
    }
    
    public func setDoneButtonBackgroundColor(_ color: UIColor) {
        doneButton.backgroundColor = color
    }
    
    // - Clear button
    
    public func setClearButtonColor(_ color: UIColor) {
        clearButton.tintColor = color
    }
    
    public func setClearButtonImage(_ image: UIImage) {
        clearButton.imageView?.image = image
    }
    
    public func setClearButtonBackgroundColor(_ color: UIColor) {
        clearButton.backgroundColor = color
    }
    
    public func resetClearButtonImage(isFilled: Bool = false) {
        let iconName = isFilled ?
            KBNumberPad.clearSymbolFilledIconName :
            KBNumberPad.clearSymbolIconName
        
        let image = loadIcon(name: iconName)
        
        setClearButtonImage(image!)
    }
    
    // MARK: - IBActions
    
    @IBAction func onNumberClicked(_ sender: UIButton) {
        let number = Int((sender.titleLabel?.text)!)
        delegate?.onNumberClicked(numberPad: self, number: number!)
    }
    
    @IBAction func onDoneClicked(_ sender: UIButton) {
        delegate?.onDoneClicked(numberPad: self)
    }
    
    @IBAction func onClearClicked(_ sender: UIButton) {
        delegate?.onClearClicked(numberPad: self)
    }
}
