//
//  CommonButtonView.swift
//  CCAppCoreSampler
//
//  Created by Connor Cates on 3/15/22.
//

import SwiftUI
import CCAppCore

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

private class CommonButtonStyleAttributes : ButtonStyleAttributes, ObservableObject {
    
    @Published var backgroundColor: Color = .blue
    
    @Published var foregroundColor: Color = .white
    
    @Published var isDisabled: Bool = false
    
    @Published var backgroundOpacityOnPress: Double = 0.3
    
    @Published var foregroundOpacityOnPress: Double = 0.3
    
    @Published var cornerRadius: CGFloat = 10
    
    @Published var borderColor: Color = .clear
    
    @Published var borderStroke: CGFloat  = 0
    
    @Published var verticalPadding: CGFloat = 10
    
    @Published var font: Font = .headline
    
    let identifier = UUID()
}

struct CommonButtonView: View {
    
    // MARK: - State Properties
    
    @State var buttonTitle: String = "Button Title"
    
    @State var styleAttributes: ButtonStyleAttributes?
    
    public init() {
        self.styleAttributes = CommonButtonStyleAttributes()
    }
    
    private var buttonView: some View {
        CommonButton(
            title: self.buttonTitle,
            styleAttributes: self.styleAttributes,
            action: {
                
            })
    }
    
    // MARK: - Style Components
    
    private var titleEditor: some View {
        HStack {
            Text("Title:")
                .font(.headline)
            Spacer(minLength: 20)
            TextField("title_text_field", text: self.$buttonTitle)
                .textFieldStyle(.roundedBorder)
                .font(.body)
        }
    }
    
    private var backgroundColorEditor: some View {
        let colors: [Color] = [
            .red, .orange, .yellow, .green, .blue, .indigo, .purple
        ]
        return ScrollView(.horizontal) {
            HStack {
                ForEach(colors) { color in
                    Button(action: {
                        self.button = self.button.background(color) as? CommonButton
                    }, label: {
                        Text("")
                    })
                        .frame(width: 50, height: 50)
                        .foregroundColor(color)
                        .background(color)
                        .clipShape(Circle())
                }
            }
        }
    }
    
    /// Scroll view of all stylable property controllers
    private var styleComponents: some View {
        List {
            Section("Content") {
                self.titleEditor
            }
            Section("Background") {
                self.backgroundColorEditor
            }
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack  {
            self.button
            self.styleComponents
        }
    }
}

struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonButtonView()
    }
}

extension Color: Identifiable {
    
    public var id: UUID {
        UUID()
    }
}
