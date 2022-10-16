//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Богдан Беннер on 14.10.22.
//

import SwiftUI

struct DetailView: View {
	@State private var isPresentingEditView = false
	let scrum: DailyScrum
	var body: some View {
		List {
			Section {
				NavigationLink(destination: MeetingView()) {
					Label("Start Meeting", systemImage: "timer")
						.font(.headline)
						.foregroundColor(.accentColor)
				}
				HStack {
					Label("Length", systemImage: "clock")
					Spacer()
					Text("\(scrum.lengthInMinutes) minutes")
				}
				.accessibilityElement(children: .combine)
				HStack {
					Label("Theme", systemImage: "paintpalette")
					Spacer()
					Text(scrum.theme.name)
						.padding(4)
						.foregroundColor(scrum.theme.accentColor)
						.background(scrum.theme.mainColor)
						.cornerRadius(4)
				}
				.accessibilityElement(children: .combine)
			} header: {
				Text("Meeting info")
			}
			Section {
				ForEach(scrum.attendees) { attendee in
					Label(attendee.name, systemImage: "person")
				}
			} header: {
				Text("Attendees")
			}
		}
		.navigationTitle(scrum.title)
		.toolbar(content: {
			Button {
				isPresentingEditView = true
			} label: {
				Text("Edit")
			}
			
		})
		.sheet(isPresented: $isPresentingEditView) {
			NavigationView {
				DetailEditView()
					.navigationTitle(scrum.title)
					.toolbar {
						ToolbarItem(placement: .cancellationAction) {
							Button("Cancel") {
								isPresentingEditView = false
							}
						}
						ToolbarItem(placement: .confirmationAction) {
							Button("Done") {
								isPresentingEditView = false
							}
						}
					}
			}
		}
	}
}

struct DetailView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			DetailView(scrum: DailyScrum.sampleData[0])
		}
	}
}
