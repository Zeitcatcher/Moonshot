//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Arseniy Oksenoyt on 5/17/24.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
