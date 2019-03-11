//
//  Elements.swift
//  MyUIKit
//
//  Created by muukii on 2019/02/27.
//  Copyright © 2019 eureka, Inc. All rights reserved.
//

import Foundation

import StorybookKit

public enum Elements {
    
    public final class MyLabel : UIView {
        
        private let label: UILabel = .init()
        
        public init(title: String) {
            super.init(frame: .zero)
            label.text = title
            
            label.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0)
                ])
            
        }
        
//        public override var intrinsicContentSize: CGSize {
//            return label.intrinsicContentSize
//        }
        
        public required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        class func makeStorybookComponent(title: String) -> StorybookComponent {
            
            let element = self.init(title: title)
            
            return StorybookComponent(element: element)
        }
        
    }
}