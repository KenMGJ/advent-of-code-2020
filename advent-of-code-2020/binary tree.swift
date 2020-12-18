//
//  binary tree.swift
//  advent-of-code-2020
//
//  Created by Ken Giroux on 12/18/20.
//

import Foundation

class Node<T> {
  var value: T
  var leftChild: Node?
  var rightChild: Node?

  init(value: T) {
    self.value = value
  }
}

enum BinaryTree<T> {
  case empty
    indirect case node(BinaryTree, T, BinaryTree)
}

extension BinaryTree: CustomStringConvertible {
  var description: String {
    switch self {
    case let .node(left, value, right):
      return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
    case .empty:
      return ""
    }
  }
}
