//
//  SelectedThemeKey.swift
//  LearnAR
//
//  Created by Victor Chandra on 04/04/23.
//

import SwiftUI

struct SelectedThemeKey: EnvironmentKey {
    static let defaultValue: ColorScheme = .light
}

extension EnvironmentValues {
    var selectedTheme: ColorScheme {
        get { self[SelectedThemeKey.self] }
        set { self[SelectedThemeKey.self] = newValue }
    }
}
