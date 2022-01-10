//
//  Extension.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import Foundation

extension String {
    func capitalizeFirstLetter()-> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
