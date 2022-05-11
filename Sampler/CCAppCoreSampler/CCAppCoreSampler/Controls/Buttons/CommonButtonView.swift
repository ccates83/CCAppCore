////
////  CommonButtonView.swift
////  CCAppCoreSampler
////
////  Created by Connor Cates on 3/15/22.
////
//
//import SwiftUI
//class CommonButtonStyleAttributes : ObservableObject {
//
//    @Published var backgroundColor: Color = .blue
//
//    let identifier = UUID()
//}
//
//struct CommonButtonView: View {
//
//    // MARK: - State Properties
//
//    @State var buttonTitle: String = "Button Title"
//    @State var styleAttributes: CommonButtonStyleAttributes
//
//    private var buttonView: some View {
//
//        CommonButton(
//            title: self.buttonTitle,
//            action: {
//
//            })
//            .environmentObject(styleAttributes)
//    }
//
//    // MARK: - Style Components
//
//    private var titleEditor: some View {
//        HStack {
//            Text("Title:")
//                .font(.headline)
//            Spacer(minLength: 20)
//            TextField("title_text_field", text: self.$buttonTitle)
//                .textFieldStyle(.roundedBorder)
//                .font(.body)
//        }
//    }
//
//    private var backgroundColorEditor: some View {
//        let colors: [Color] = [
//            .red, .orange, .yellow, .green, .blue, .indigo, .purple
//        ]
//        return ScrollView(.horizontal) {
//            HStack {
//                ForEach(colors) { color in
//                    Button(action: {
////                        self.$styleAttributes.backgroundColor = color
//                    }, label: {
//                        Text("")
//                    })
//                        .frame(width: 50, height: 50)
//                        .foregroundColor(color)
//                        .background(color)
//                        .clipShape(Circle())
//                }
//            }
//        }
//    }
//
//    /// Scroll view of all stylable property controllers
//    private var styleComponents: some View {
//        List {
//            Section("Content") {
//                self.titleEditor
//            }
//            Section("Background") {
//                self.backgroundColorEditor
//            }
//        }
//    }
//
//    // MARK: - Body
//
//    var body: some View {
//        VStack  {
//            self.buttonView
//            self.styleComponents
//        }
//    }
//}
//
//struct CommonButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommonButtonView(buttonTitle: "Button title!", styleAttributes: CommonButtonStyleAttributes())
//    }
//}
//
//extension Color: Identifiable {
//
//    public var id: UUID {
//        UUID()
//    }
//}
//
//
////import CCAppCore
////
////class CommonButtonStyleAttributes : ButtonStyleAttributes, ObservableObject {
////
////    @Published var backgroundColor: Color = .blue
////
////    @Published var foregroundColor: Color = .white
////
////    @Published var isDisabled: Bool = false
////
////    @Published var backgroundOpacityOnPress: Double = 0.3
////
////    @Published var foregroundOpacityOnPress: Double = 0.3
////
////    @Published var cornerRadius: CGFloat = 10
////
////    @Published var borderColor: Color = .clear
////
////    @Published var borderStroke: CGFloat  = 0
////
////    @Published var verticalPadding: CGFloat = 10
////
////    @Published var font: Font = .headline
////
////    let identifier = UUID()
////}
////
////struct CommonButtonView: View {
////
////    // MARK: - State Properties
////
////    @State var buttonTitle: String = "Button Title"
////    @EnvironmentObject var styleAttributes: CommonButtonStyleAttributes
////
////    private var buttonView: some View {
////
////        CommonButton(
////            title: self.buttonTitle,
////            action: {
////
////            })
////            .environmentObject(styleAttributes)
////    }
////
////    // MARK: - Style Components
////
////    private var titleEditor: some View {
////        HStack {
////            Text("Title:")
////                .font(.headline)
////            Spacer(minLength: 20)
////            TextField("title_text_field", text: self.$buttonTitle)
////                .textFieldStyle(.roundedBorder)
////                .font(.body)
////        }
////    }
////
////    private var backgroundColorEditor: some View {
////        let colors: [Color] = [
////            .red, .orange, .yellow, .green, .blue, .indigo, .purple
////        ]
////        return ScrollView(.horizontal) {
////            HStack {
////                ForEach(colors) { color in
////                    Button(action: {
//////                        self.$styleAttributes.backgroundColor = color
////                    }, label: {
////                        Text("")
////                    })
////                        .frame(width: 50, height: 50)
////                        .foregroundColor(color)
////                        .background(color)
////                        .clipShape(Circle())
////                }
////            }
////        }
////    }
////
////    /// Scroll view of all stylable property controllers
////    private var styleComponents: some View {
////        List {
////            Section("Content") {
////                self.titleEditor
////            }
////            Section("Background") {
////                self.backgroundColorEditor
////            }
////        }
////    }
////
////    // MARK: - Body
////
////    var body: some View {
////        VStack  {
////            self.buttonView
////            self.styleComponents
////        }
////    }
////}
////
////struct CommonButtonView_Previews: PreviewProvider {
////    static var previews: some View {
////        CommonButtonView(buttonTitle: "Button title!")
////            .environmentObject(CommonButtonStyleAttributes())
////    }
////}
////
////extension Color: Identifiable {
////
////    public var id: UUID {
////        UUID()
////    }
////}
