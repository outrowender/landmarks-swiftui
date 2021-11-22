//
//  LandmarkList.swift
//  landmarks
//
//  Created by Wender Patrick on 15/11/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { lmk in
            (!showFavoritesOnly || lmk.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                // good example on how to iterate items
                ForEach(filteredLandmarks) { landmarkItem in
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
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13"], id: \.self) { deviceName in
            LandmarkList()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
