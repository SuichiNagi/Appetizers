//
//  String+Ext.swift
//  Appetizers
//
//  Created by Aldrei Glenn Nuqui on 6/11/24.
//

import Foundation
import RegexBuilder

extension String {
    var isValidEmail: Bool {
//        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-ZA-z]{2,65}"
//        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
//        return emailPredicate.evaluate(with: self)
        
        let emailRegex = Regex {
            OneOrMore {
                CharacterClass(
                    .anyOf("._%+-"),
                    ("A"..."Z"),
                    ("0"..."9"),
                    ("a"..."z")
                )
            }
            "@"
            OneOrMore {
                CharacterClass(
                    .anyOf("-"),
                    ("A"..."Z"),
                    ("a"..."z"),
                    ("0"..."9")
                )
            }
            "."
            Repeat(2...65) {
                CharacterClass(
                    ("A"..."Z"),
                    ("A"..."z")
                )
            }
        }
        
        return self.wholeMatch(of: emailRegex) != nil
    }
}
