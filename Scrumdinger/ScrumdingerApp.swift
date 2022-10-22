//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Богдан Беннер on 10.10.22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
	@State private var scrums = DailyScrum.sampleData
	
    var body: some Scene {
        WindowGroup {
			NavigationView {
				ScrumsView(scrums: $scrums)
			}
        }
    }
}

