//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Богдан Беннер on 14.10.22.
//

import SwiftUI

struct DetailEditView: View {
	@State private var data = DailyScrum.Data()
	@State private var newAttendeeName = ""
	
    var body: some View {
		Form {
			Section {
				TextField("Title", text: $data.title)
				HStack {
					Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
						Text("Length")
					}
					.accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
					Spacer()
					Text("\(Int(data.lengthInMinutes)) minutes")
						.accessibilityHidden(true)
				}
			} header: {
				Text("Meeting Info")
			}
			Section {
				ForEach(data.attendees) { attendee in
					Text(attendee.name)
				}
				.onDelete { indicies in
					data.attendees.remove(atOffsets: indicies)
				}
				HStack {
					TextField("New Attendee", text: $newAttendeeName)
					Button {
						withAnimation {
							let newAttendee = DailyScrum.Attendee(name: newAttendeeName)
							data.attendees.append(newAttendee)
							newAttendeeName = ""
						}
					} label: {
						Image(systemName: "plus.circle.fill")
							.accessibilityLabel("Add attendee")
					}
					.disabled(newAttendeeName.isEmpty)

				}
			} header: {
				Text("Attendees")
			}

		}
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
