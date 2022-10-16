//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Богдан Беннер on 11.10.22.
//

import SwiftUI

struct ScrumsView: View {
	let scrums: [DailyScrum]
    var body: some View {
		List(scrums) { scrum in
			NavigationLink(destination: DetailView(scrum: scrum)) {
				CardView(scrum: scrum)
			}
			.listRowBackground(scrum.theme.mainColor)
		}
		.navigationTitle("Daily Scrums")
		.navigationBarTitleDisplayMode(.large)
		.toolbar {
			Button {
				
			} label: {
				Image(systemName: "plus")
			}
			.accessibilityLabel("New Scrum")
		}
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
		NavigationStack {
			ScrumsView(scrums: DailyScrum.sampleData)
		}
    }
}
