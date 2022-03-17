//
//  MainView.swift
//  CCAppCoreSampler
//
//  Created by Connor Cates on 3/15/22.
//

import SwiftUI
import CCAppCore

private enum MainViewRows: String, CaseIterable, Identifiable {
        
    var id : String {
        return UUID().uuidString
    }
    
    case commonButton = "Common Button"
    
    var title: String {
        return self.rawValue
    }
    
    var destination: some View {
        switch self {
        case .commonButton:
            return CommonButtonView(buttonTitle: "Button title!",
                                    styleAttributes: CommonButtonStyleAttributes())
        }
    }
    
}

struct MainView: View {
    
    var body: some View {
        NavigationView {
            List(MainViewRows.allCases) { row in
                NavigationLink(destination: {
                    row.destination
                }, label: {
                    Text(row.rawValue)
                })
                }
                .navigationBarTitle("CC App Core")
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
