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

struct CCButtonStyleAttributes : ButtonStyleAttributes {
    var backgroundColor: Color
    var foregroundColor: Color
    var isDisabled: Bool
    var backgroundOpacityOnPress: Double = 0.3
    var foregroundOpacityOnPress: Double = 0.3
    var cornerRadius: CGFloat = 6
    var borderColor: Color = .black
    var borderStroke: CGFloat = 3
    var verticalPadding: CGFloat = 10
    var font: Font = Font.system(size: 19, weight: .semibold)
}

struct CommonButtonStyle: ButtonStyle {
    
    var constants: ButtonStyleAttributes
    
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
    
    private static let buttonHorizontalMargins: CGFloat = 20
    
    private let title: String
    private let action: () -> Void
    
    private let styleAttributes: ButtonStyleAttributes
    
    public init(title: String,
                styleAttributes: ButtonStyleAttributes,
                action: @escaping () -> Void) {
        self.title = title
        self.styleAttributes = styleAttributes
        self.action = action
    }
        
    public var body: some View {
        HStack {
            Spacer(minLength: CommonButton.buttonHorizontalMargins)
            Button(action:self.action) {
                Text(self.title)
                    .frame(maxWidth:.infinity)
            }
            .buttonStyle(CommonButtonStyle(
                constants: self.styleAttributes))
            .disabled(self.styleAttributes.isDisabled)
            Spacer(minLength: CommonButton.buttonHorizontalMargins)
        }
        .frame(maxWidth:.infinity)
    }
}


struct CommonButton_Previews: PreviewProvider {
    static var previews: some View {
        CommonButton(title: "button", styleAttributes: CCButtonStyleAttributes(backgroundColor: .blue, foregroundColor: .white, isDisabled: false)) {
            
        }
    }
}
