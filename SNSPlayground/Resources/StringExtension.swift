//
//  StringExtension.swift
//  SNSPlayground
//
//  Created by 김민성 on 2022/11/25.
//

import Foundation

extension String {
    func safeKey() -> String {
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
    }
}
