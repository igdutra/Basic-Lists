//
//  Constraints+Superview.swift
//  TruckShared
//
//  Created by Adriano Paladini on 07/01/20.
//  Copyright © 2020 Anheuser-Busch inBev. All rights reserved.
//

import UIKit

public extension UIView {

    // swiftlint:disable line_length
    @discardableResult
    func topToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        var anchor: Any?
        if #available(iOS 11.0, *) {
            anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        } else {
            anchor = superview
        }
        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: relation, toItem: anchor, attribute: .top, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func bottomToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        var anchor: Any?
        if #available(iOS 11.0, *) {
            anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        } else {
            anchor = superview
        }
        let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: relation, toItem: anchor, attribute: .bottom, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func leadingToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        var anchor: Any?
        if #available(iOS 11.0, *) {
            anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        } else {
            anchor = superview
        }
        let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: relation, toItem: anchor, attribute: .leading, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func trailingToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        var anchor: Any?
        if #available(iOS 11.0, *) {
            anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        } else {
            anchor = superview
        }
        let constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: relation, toItem: anchor, attribute: .trailing, multiplier: multiplier, constant: -margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func widthToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        var anchor: Any?
        if #available(iOS 11.0, *) {
            anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        } else {
            anchor = superview
        }
        let constraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relation, toItem: anchor, attribute: .width, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func heightToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        var anchor: Any?
        if #available(iOS 11.0, *) {
            anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        } else {
            anchor = superview
        }
        let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relation, toItem: anchor, attribute: .height, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }
}

public extension UIView {

    @discardableResult
    func horizontalToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        self.leadingToSuperview(margin, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        self.trailingToSuperview(margin, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        return self
    }

    @discardableResult
    func verticalToSuperview(_ margin: CGFloat = 0.0, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        self.topToSuperview(margin, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        self.bottomToSuperview(margin, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive)
        return self
    }
}

public extension UIView {

    @discardableResult
    func edgesToSuperView(excluding: LayoutEdge = .none, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        if !excluding.contains(.leading) { self.leadingToSuperview(margin, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive) }
        if !excluding.contains(.trailing) { self.trailingToSuperview(margin, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive) }
        if !excluding.contains(.top) { self.topToSuperview(margin, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive) }
        if !excluding.contains(.bottom) { self.bottomToSuperview(margin, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive) }
        return self
    }

    @discardableResult
    func edgesToSuperView(excluding: LayoutEdge = .none, relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, margin: UIEdgeInsets, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        if !excluding.contains(.leading) { self.leadingToSuperview(margin.left, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive) }
        if !excluding.contains(.trailing) { self.trailingToSuperview(margin.right, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive) }
        if !excluding.contains(.top) { self.topToSuperview(margin.top, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive) }
        if !excluding.contains(.bottom) { self.bottomToSuperview(margin.bottom, relation: relation, priority: priority, toSafeArea: toSafeArea, isActive: isActive) }
        return self
    }
}

public extension UIView {

    @discardableResult
    func centerHorizontalToSuperView(relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        var anchor: Any?
        if #available(iOS 11.0, *) {
            anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        } else {
            anchor = superview
        }
        let constraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: relation, toItem: anchor, attribute: .centerX, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func centerVerticalToSuperView(relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        guard let superview = self.superview else { return self }
        var anchor: Any?
        if #available(iOS 11.0, *) {
            anchor = toSafeArea ? superview.safeAreaLayoutGuide : superview
        } else {
            anchor = superview
        }
        let constraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: relation, toItem: anchor, attribute: .centerY, multiplier: multiplier, constant: margin)
        constraint.priority = priority
        constraint.isActive = isActive
        return self
    }

    @discardableResult
    func centerToSuperView(relation: NSLayoutConstraint.Relation = .equal, multiplier: CGFloat = 1, priority: UILayoutPriority = .defaultHigh, margin: CGFloat = 0.0, toSafeArea: Bool = false, isActive: Bool = true) -> Self {
        self.centerHorizontalToSuperView(relation: relation, priority: priority, margin: margin, toSafeArea: toSafeArea, isActive: isActive)
        self.centerVerticalToSuperView(relation: relation, priority: priority, margin: margin, toSafeArea: toSafeArea, isActive: isActive)
        return self
    }
}
// swiftlint:enable line_length
