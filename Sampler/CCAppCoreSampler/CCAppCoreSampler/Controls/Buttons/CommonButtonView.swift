//
//  CommonButtonView.swift
//  CCAppCoreSampler
//
//  Created by Connor Cates on 3/15/22.
//

import SwiftUI
import CCAppCore

struct CommonButtonView: View {
    
    // MARK: - State Properties
    
    @State var buttonTitle: String = "Button Title"
    
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
        Text("")
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
            CommonButton(title: self.buttonTitle, action: {
                print("I was clicked!")
            })
            self.styleComponents
        }
    }
}

struct CommonButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CommonButtonView()
    }
}
