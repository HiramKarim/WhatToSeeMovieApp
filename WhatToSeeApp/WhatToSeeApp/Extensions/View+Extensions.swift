//
//  View+Extensions.swift
//  WhatToSeeApp
//
//  Created by Hiram Castro on 08/02/24.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
