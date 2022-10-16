//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Богдан Беннер on 10.10.22.
//

import Foundation

struct DailyScrum: Identifiable {
	var id: UUID = UUID()
	var title: String
	var lengthInMinutes: Int
	var theme: Theme
	var attendees: [Attendee]
	
	init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
		self.id = id
		self.title = title
		self.attendees = attendees.map{ Attendee(name: $0) }
		self.lengthInMinutes = lengthInMinutes
		self.theme = theme
	}
}


extension DailyScrum {
	static let sampleData: [DailyScrum] =
	[
		DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .seafoam),
		DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
		DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
	]
}

extension DailyScrum {
	struct Attendee: Identifiable {
		let id: UUID
		var name: String
		
		init(id: UUID = UUID(), name: String) {
			self.id = id
			self.name = name
		}
	}
	
	struct Data {
		var title: String = ""
		var attendees: [Attendee] = []
		var lengthInMinutes: Double = 5
		var theme: Theme = .seafoam
	}
	
	var data: Data {
		Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
		
	}
	
	mutating func update(from data: Data) {
		title = data.title
		attendees = data.attendees
		lengthInMinutes = Int(data.lengthInMinutes)
		theme = data.theme
	}
}
