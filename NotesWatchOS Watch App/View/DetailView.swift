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
	@State private var areCreditsPresented: Bool = false
	
	
	// MARK: - body
	
	var body: some View {
		VStack(alignment: .center, spacing: 3) {
			// header
			HeaderView()
			
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
					.onTapGesture {
						areCreditsPresented.toggle()
					}
					.sheet(isPresented: $areCreditsPresented) {
						CreditsView()
					}
				
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
