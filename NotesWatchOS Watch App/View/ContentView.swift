//
//  ContentView.swift
//  NotesWatchOS Watch App
//
//  Created by Isaac Urbina on 5/15/25.
//

import SwiftUI

struct ContentView: View {
	
	
	// MARK: - property
	
	@State private var notes: [Note] = [Note]()
	@State private var text: String = ""
	
	
	// MARK: - function
	
	private func save() {
		dump(notes)
	}
	
	
	// MARK: - body
	
	var body: some View {
		VStack {
			HStack(alignment: .center, spacing: 6) {
				TextField("Add New Note", text: $text)
				
				Button {
					// 1. only run the button's action when the text field is not empty
					guard text.isEmpty == false else { return }
					
					// 2. create a new note item and initialize it with the text value
					let note = Note(id: UUID(), text: text)
					
					// 3. add the new note item to the notes array (append)
					notes.append(note)
					
					// 4. make the text field empty
					text = ""
					
					// 5. save the notes (function)
					save()
					
				} label: {
					Image(systemName: "plus.circle")
						.font(.system(size: 42, weight: .semibold))
				} // Button
				.fixedSize()
				.buttonStyle(PlainButtonStyle())
				.foregroundColor(.accentColor)
			} // HStack
			
			Spacer()
			
			Text("\(notes.count)")
			
		} // VStack
		.navigationTitle("Notes")
	}
}


// MARK: - preview

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
