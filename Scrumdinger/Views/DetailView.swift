//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Богдан Беннер on 14.10.22.
//

import SwiftUI

struct DetailView: View {
	@Binding var scrum: DailyScrum
	@State private var isPresentingEditView = false
	@State private var data = DailyScrum.Data()
	
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
				data = scrum.data
			} label: {
				Text("Edit")
			}
			
		})
		.sheet(isPresented: $isPresentingEditView) {
			NavigationView {
				DetailEditView(data: $data)
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
								scrum.update(from: data)
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
			DetailView(scrum: .constant(DailyScrum.sampleData[0]))
		}
	}
}
