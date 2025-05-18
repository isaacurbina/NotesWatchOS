//
//  SettingsView.swift
//  NotesWatchOS Watch App
//
//  Created by Isaac Urbina on 5/18/25.
//

import SwiftUI

struct SettingsView: View {
	
	
	// MARK: - properties
	
	@AppStorage("lineCount") var lineCount: Int = 1
	@State private var value: Float = 1.0
	
	
	// MARK: - function
	
	private func update() {
		lineCount = Int(value)
	}
	
	
	// MARK: - body
	
	var body: some View {
		VStack(spacing: 8) {
			// header
			HeaderView(title: "Settings")
			
			// actual line count
			Text("Lines: \(lineCount)".uppercased())
				.fontWeight(.bold)
			
			// slider
			Slider(
				value: Binding(
					get: { self.value },
					set: { newValue in
						self.value = newValue
						self.update()
					}),
				in: 1...4, step: 1)
			.accentColor(.accentColor)
			
		} // VStack
	}
}


// MARK: - preview

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
