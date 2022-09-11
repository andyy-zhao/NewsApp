//
//  RetryView.swift
//  NewsApp
//
//  Created by Andy Zhao on 2022-06-17.
//

import SwiftUI

struct RetryView: View {
    let text: String
    let retryAction: () -> ()
    var body: some View {
        VStack(spacing: 8) {
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(.leading)
                .padding(.trailing)
            Button(action: retryAction) {
                Text("Try again")
            }
        }
    }
}

struct RetryView_Previews: PreviewProvider {
    static var previews: some View {
        RetryView(text: "An error occurred") {
            
        }
    }
}
