//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Богдан Беннер on 10.10.22.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
		VStack(alignment: .leading) {
			ProgressView(value: 5, total: 15)
			HStack {
				VStack {
					Text("Seconds Elaspsed")
						.font(.caption)
					Label("300", systemImage: "hourglass.bottomhalf.fill")
				}
				Spacer()
				VStack(alignment: .trailing) {
					Text("Seconds Remaining")
						.font(.caption)
					Label("600", systemImage: "hourglass.tophalf.fill")
				}
			}
			.accessibilityElement(children: .ignore)
			.accessibilityLabel("Time remaining")
			.accessibilityValue("10 minutes")
			Circle()
				.strokeBorder(lineWidth: 24)
			HStack {
				Text("Speaker 1 of 3")
				Spacer()
				Button {
					
				} label: {
					Image(systemName: "forward.fill")
				}
				.accessibilityLabel("Next speaker")
			}
		}
		.padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
