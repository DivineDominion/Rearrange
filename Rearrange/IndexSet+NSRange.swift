//
//  IndexSet+NSRange.swift
//  Edit
//
//  Created by Matt Massicotte on 2018-10-18.
//  Copyright © 2018 Chime Systems Inc. All rights reserved.
//

import Foundation

public extension IndexSet {
    init(integersIn range: NSRange) {
        self.init(integersIn: Range<IndexSet.Element>(range)!)
    }

    mutating func insert(range: NSRange) {
        insert(integersIn: Range<IndexSet.Element>(range)!)
    }

    mutating func insert(ranges: [NSRange]) {
        ranges.forEach { insert(range: $0) }
    }

    var nsRangeView: [NSRange] {
        return rangeView.map { NSRange($0) }
    }

    func contains(integersIn range: NSRange) -> Bool {
        return contains(integersIn: Range<IndexSet.Element>(range)!)
    }

    var limitSpanningRange: NSRange? {
        guard let start = self.min(), let end = self.max() else {
            return nil
        }

        return NSRange(start...end)
    }
}
