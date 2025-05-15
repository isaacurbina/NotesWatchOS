//
//  Note.swift
//  NotesWatchOS Watch App
//
//  Created by Isaac Urbina on 5/15/25.
//

import Foundation

struct Note: Identifiable, Codable {
	let id: UUID
	let text: String
}
