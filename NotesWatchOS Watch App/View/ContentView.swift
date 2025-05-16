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
		do {
			// 1. convert the notes array to data using JSONEncoder
			let data = try JSONEncoder().encode(notes)
			
			// 2. create a new url to save the file using the getDocumentDirectory
			let url = getDocumentDirectory().appendingPathComponent("notes")
			
			// 3. write the data to the given url
			try data.write(to: url)
			
		} catch {
			print("Saving data has failed!")
		}
	}
	
	private func getDocumentDirectory() -> URL {
		let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return path[0]
	}
	
	private func load() {
		DispatchQueue.main.async {
			do {
				// 1. get the notes url path
				let url = getDocumentDirectory().appendingPathComponent("notes")
				
				// 2. create a new property for the data
				let data = try Data(contentsOf: url)
				
				// 3. decode the data
				notes = try JSONDecoder().decode([Note].self, from: data)
				
			} catch {
				// do nothing
			}
		}
	}
	
	private func delete(offsets: IndexSet) {
		withAnimation {
			notes.remove(atOffsets: offsets)
			save()
		}
	}
	
	
	// MARK: - body
	
	var body: some View {
		NavigationView {
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
				
				if notes.count >= 1 {
					List {
						ForEach(0..<notes.count, id: \.self) { i in
							NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
								HStack {
									Capsule()
										.frame(width: 4)
										.foregroundColor(.accentColor)
									Text(notes[i].text)
								} // HStack
							} // NavigationLink
						} // ForEach
						.onDelete(perform: delete)
						
					} // List
				} else {
					Spacer()
					Image(systemName: "note.text")
						.resizable()
						.scaledToFit()
						.foregroundColor(.gray)
						.opacity(0.25)
						.padding(25)
					Spacer()
				}
				
			} // VStack
			.navigationTitle("Notes")
			.onAppear() { load() }
		} // NavigationView
	}
}


// MARK: - preview

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
