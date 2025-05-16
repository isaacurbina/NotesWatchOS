//
//  DetailView.swift
//  NotesWatchOS Watch App
//
//  Created by Isaac Urbina on 5/16/25.
//

import SwiftUI

struct DetailView: View {
	
	
	// MARK: - properties
	
	let note: Note
	let count: Int
	let index: Int
	
	
	// MARK: - body
	
	var body: some View {
		VStack(alignment: .center, spacing: 3) {
			// header
			HStack {
				Capsule()
					.frame(height: 1)
				
				Image(systemName: "note.text")
				
				Capsule()
					.frame(height: 1)
			} // HStack
			.foregroundColor(.accentColor)
			
			// content
			Spacer()
			ScrollView(.vertical) {
				Text(note.text)
					.font(.title3)
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)
			}
			Spacer()
			
			// footer
			HStack(alignment: .center) {
				Image(systemName: "gear")
					.imageScale(.large)
				Spacer()
				Text("\(index + 1) / \(count)")
				Spacer()
				Image(systemName: "info.circle")
					.imageScale(.large)
				
			} // HStack
			.foregroundColor(.accentColor)
			
		} // VStack
		.padding(3)
	}
}


// MARK: - preview

struct DetailView_Previews: PreviewProvider {
	
	static var sampleData: Note = Note(id: UUID(), text: "Hello, World!")
	
	static var previews: some View {
		DetailView(
			note: sampleData,
			count: 5,
			index: 0
		)
	}
}
