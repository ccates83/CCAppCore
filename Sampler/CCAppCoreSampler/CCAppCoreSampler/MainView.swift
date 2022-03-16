//
//  MainView.swift
//  CCAppCoreSampler
//
//  Created by Connor Cates on 3/15/22.
//

import SwiftUI

private enum MainViewRows: String, CaseIterable, Identifiable {
        
    var id : String {
        return UUID().uuidString
    }
    
    case commonButton = "Common Button"
    
    var title: String {
        return self.rawValue
    }
    
}

struct MainView: View {
    
    var body: some View {
        NavigationView {
            List(MainViewRows.allCases) { row in
                Text(row.title)
                    }
                    .navigationBarTitle("CCAppCoreSampler")
                }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
