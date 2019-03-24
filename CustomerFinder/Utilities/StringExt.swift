//
//  StringExt.swift
//  CustomerFinder
//
//  Created by Mostafa Elbaz on 3/23/19.
//  Copyright © 2019 Mostafa Elbaz. All rights reserved.
//

import UIKit

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
