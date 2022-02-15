//
//  UIBotton.swift
//  testTaskForITS_Partner
//
//  Created by sleman on 14.02.22.
//

import UIKit


extension CGColor {
    var UIColor: UIKit.UIColor {
        return UIKit.UIColor(cgColor: self)
    }
}

extension UIButton {
    
    /// Радиус гараницы
    @IBInspectable override var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }
    /// Толщина границы
    @IBInspectable override var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    /// Цвет границы
    @IBInspectable override var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get { return layer.borderColor?.UIColor }
    }
    /// Стиль кнопки
    @IBInspectable var style: String? {
        set { setupWithStyleNamed(named: newValue) }
        get { return nil }
    }
    /// Применение стиля по его строковому названию
    private func setupWithStyleNamed(named: String?) {
        if let styleName = named, let style = ButtonStyle(rawValue: styleName) {
            setupWithStyle(style: style)
        }
    }
    /// Применение стиля по его идентификатору
    func setupWithStyle(style: ButtonStyle) {
        backgroundColor = style.backgroundColor
        tintColor = style.tintColor
        borderColor = style.borderColor
        borderWidth = style.borderWidth
        cornerRadius = style.cornerRadius
    }
}

enum ButtonStyle: String {

    /// Светлый стиль
    case Light = "light"
    /// Темный стиль
    case Dark = "dark"

    /// Оттенок
    var tintColor: UIColor {
        switch self {
        case .Light: return UIColor.black
        case .Dark: return UIColor.lightGray
        }
    }
    /// Цвет границы
    var borderColor: UIColor { return tintColor }
    /// Цвет фона
    var backgroundColor: UIColor { return UIColor.clear }
    /// Толщина границы
    var borderWidth: CGFloat { return 1 }
    /// Радиус границы
    var cornerRadius: CGFloat { return 4 }
}
