//
//  Date+Formatter.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import UIKit

extension String {
    
    func formattedDateFromString(dateString: String, withFormat format: String) -> String? {

        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"

        if let date = inputFormatter.date(from: dateString) {

            let outputFormatter = DateFormatter()
          outputFormatter.dateFormat = format

            return outputFormatter.string(from: date)
        }

        return nil
    }
}
