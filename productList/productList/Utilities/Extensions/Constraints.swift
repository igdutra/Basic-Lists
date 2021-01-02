//
//  Constraints.swift
//  TruckShared
//
//  Created by Adriano Paladini on 07/01/20.
//  Copyright © 2020 Anheuser-Busch inBev. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {

    func off() {
        isActive =  false
    }
    func on() {
        isActive =  true
    }
    func toggle() {
        isActive = !isActive
    }
}

public extension UIView {

    struct LayoutEdge: OptionSet {
        public let rawValue: UInt8
        public init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
        public static let top = LayoutEdge(rawValue: 1)
        public static let bottom = LayoutEdge(rawValue: 1 << 1)
        public static let trailing = LayoutEdge(rawValue: 1 << 2)
        public static let leading = LayoutEdge(rawValue: 1 << 3)
        public static let none = LayoutEdge(rawValue: 1 << 4)
    }

    @discardableResult
    func addSubviews(_ views: [UIView]) -> Self {
        for view in views {
            view.autoResizingOff()
            self.addSubview(view)
        }
        return self
    }

    @discardableResult
    func autoResizingOff() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

public extension UIViewController {

    func prepareViewsForLayout(_ views: [UIView]) {
        for view in views {
            view.autoResizingOff()
        }
    }
}

public extension UIView {

    func widthConstraint() -> NSLayoutConstraint? {
        return self.constraints.filter { $0.firstAttribute == NSLayoutConstraint.Attribute.width }.first
    }

    func heightConstraint() -> NSLayoutConstraint? {
        return self.constraints.filter { $0.firstAttribute == NSLayoutConstraint.Attribute.height }.first
    }

    func topConstraint() -> NSLayoutConstraint? {
        if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: NSLayoutConstraint.Attribute.top) {
                return constraint
            }
        }
        return nil
    }

    func bottomConstraint() -> NSLayoutConstraint? {
        if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: NSLayoutConstraint.Attribute.bottom) {
                return constraint
            }
        }
        return nil
    }

    func leadingConstraint() -> NSLayoutConstraint? {
        if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: NSLayoutConstraint.Attribute.leading) {
                return constraint
            }
        }
        return nil
    }

    func trailingConstraint() -> NSLayoutConstraint? {
        if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: NSLayoutConstraint.Attribute.trailing) {
                return constraint
            }
        }
        return nil
    }

    private func itemMatch(constraint: NSLayoutConstraint, layoutAttribute: NSLayoutConstraint.Attribute) -> Bool {
        if let firstItem = constraint.firstItem as? UIView, let secondItem = constraint.secondItem as? UIView {
            let firstItemMatch = firstItem == self && constraint.firstAttribute == layoutAttribute
            let secondItemMatch = secondItem == self && constraint.secondAttribute == layoutAttribute
            return firstItemMatch || secondItemMatch
        }
        return false
    }
}

public extension UIView {

    @discardableResult
    func widthTo(_ constant: CGFloat, priority: UILayoutPriority = .defaultHigh) -> Self {
        let constraint = self.widthAnchor.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func heightTo(_ constant: CGFloat, priority: UILayoutPriority = .defaultHigh) -> Self {
        let constraint = self.heightAnchor.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
}

public extension UIView {

    @discardableResult
    func topToBottom(of element: UIView, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0) -> Self {
        let constraint = self.topAnchor.constraint(equalTo: element.bottomAnchor, constant: margin)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func bottomToTop(of element: UIView, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0) -> Self {
        let constraint = self.bottomAnchor.constraint(equalTo: element.topAnchor, constant: margin)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func leadingToTrailing(of element: UIView, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0) -> Self {
        let constraint = self.leadingAnchor.constraint(equalTo: element.trailingAnchor, constant: margin)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func trailingToLeading(of element: UIView, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0) -> Self {
        let constraint = self.trailingAnchor.constraint(equalTo: element.leadingAnchor, constant: margin)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func topToTop(of element: UIView, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0) -> Self {
        let constraint = self.topAnchor.constraint(equalTo: element.topAnchor, constant: margin)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func bottomToBottom(of element: UIView, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0) -> Self {
        let constraint = self.bottomAnchor.constraint(equalTo: element.bottomAnchor, constant: margin)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func leadingToLeading(of element: UIView, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0) -> Self {
        let constraint = self.leadingAnchor.constraint(equalTo: element.leadingAnchor, constant: margin)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult
    func trailingToTrailing(of element: UIView, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0) -> Self {
        let constraint = self.trailingAnchor.constraint(equalTo: element.trailingAnchor, constant: margin)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
}

public extension UIView {

    @discardableResult
    func setHugging(_ priority: UILayoutPriority = .defaultHigh, for axis: NSLayoutConstraint.Axis) -> Self {
        setContentHuggingPriority(priority, for: axis)
        return self
    }

    @discardableResult
    func setCompressionResistance(_ priority: UILayoutPriority = .defaultHigh, for axis: NSLayoutConstraint.Axis) -> Self {
        setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
}
