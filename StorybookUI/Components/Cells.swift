//
// Copyright (c) 2020 Eureka, Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

// MARK: - SectionCell
@available(*, deprecated)
final class SectionCell : EmptyStackCell {

  // MARK: - Properties

  private let titleLabel = UILabel()

  // MARK: - Initializers

  init(title: String) {

    super.init()

    titleLabel.numberOfLines = 0
    titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(titleLabel)

    NSLayoutConstraint.activate([
      titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16.0),
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0)
    ])

    set(title: title)

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Functions

  func set(title: String) {
    titleLabel.text = title
  }

}

// MARK: - ItemCell
@available(*, deprecated)
final class ItemCell : HighlightStackCell {

  // MARK: Properties

  private let titleLabel = UILabel()

  private let didTapAction: () -> Void

  // MARK: - Initializers

  init(title: String, didTap: @escaping () -> Void = {}) {

    self.didTapAction = didTap
    super.init()

    addTarget(self, action: #selector(_didTap), for: .touchUpInside)


    titleLabel.numberOfLines = 0
    titleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)

    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(titleLabel)

    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32.0),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
      titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16.0)
    ])

    set(title: title)

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Functions

  func set(title: String) {
    titleLabel.text = title
  }

  @objc private dynamic func _didTap() {
    didTapAction()
  }

}