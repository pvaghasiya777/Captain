//
//  CITreeViewNode.swift
//  CITreeView
//
//

import UIKit

public final class CITreeViewNode: NSObject {
    public var parentNode: CITreeViewNode?
    public var expand: Bool = false
    public var level: Int = 0
    public var item: Any
    
    init(item: Any) {
        self.item = item
    }
}
