//
//  SwiftUIView.swift
//  
//
//  Created by Connor Cates on 3/15/22.
//

import SwiftUI

public protocol ButtonStyleAttributes {
    var backgroundColor: Color { get set }
    var foregroundColor: Color { get set }
    var isDisabled: Bool { get set }
    var backgroundOpacityOnPress: Double { get set }
    var foregroundOpacityOnPress: Double { get set }
    var cornerRadius: CGFloat { get set }
    var borderColor: Color { get set }
    var borderStroke: CGFloat { get set }
    var verticalPadding: CGFloat { get set }
    var font: Font { get set }
}

class CommonButtonStyleAttributes: ObservableObject, ButtonStyleAttributes {
    @Published var backgroundColor: Color = .blue
    @Published var foregroundColor: Color = .white
    @Published var isDisabled: Bool = false
    @Published var backgroundOpacityOnPress: Double = 0.3
    @Published var foregroundOpacityOnPress: Double = 0.3
    @Published var cornerRadius: CGFloat = 6
    @Published var borderColor: Color = .black
    @Published var borderStroke: CGFloat = 3
    @Published var verticalPadding: CGFloat = 10
    @Published var font: Font = Font.system(size: 19, weight: .semibold)
}

struct CommonButtonStyle: ButtonStyle {
    
    @EnvironmentObject var constants: CommonButtonStyleAttributes
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = self.constants.isDisabled || configuration.isPressed ? self.constants.foregroundColor.opacity(self.constants.foregroundOpacityOnPress) : self.constants.foregroundColor
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(self.constants.isDisabled || configuration.isPressed ? self.constants.backgroundColor.opacity(self.constants.backgroundOpacityOnPress) : self.constants.backgroundColor)
            // This is the key part, we are using both an overlay as well as cornerRadius
            .cornerRadius(self.constants.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: self.constants.cornerRadius)
                    .stroke(self.constants.borderColor, lineWidth: self.constants.borderStroke)
        )
            .padding([.top, .bottom], self.constants.verticalPadding)
            .font(self.constants.font)
    }
}

public struct CommonButton: View {
    @EnvironmentObject var styleAttributes: CommonButtonStyleAttributes
    
    public let title: String
    public let action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
        
    public var body: some View {
        HStack {
            Spacer(minLength: CommonButton.buttonHorizontalMargins)
            Button(action:self.action) {
                Text(self.title)
                    .frame(maxWidth:.infinity)
            }
            .buttonStyle(
                CommonButtonStyle()
            )
            Spacer(minLength: CommonButton.buttonHorizontalMargins)
        }
        .frame(maxWidth:.infinity)
    }
}

extension CommonButton {
    private static let buttonHorizontalMargins: CGFloat = 20
}
