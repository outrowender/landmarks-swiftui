//
//  LandmarkList.swift
//  landmarks
//
//  Created by Wender Patrick on 15/11/21.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            // good example on how to iterate items
            List(landmarks) { landmarkItem in
                NavigationLink {
                    LandmarkDetail(landmark: landmarkItem)
                } label: {
                    LandmarkRow(landmark: landmarkItem)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13 mini"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
