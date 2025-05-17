//
//  HeaderView.swift
//  NotesWatchOS Watch App
//
//  Created by Isaac Urbina on 5/17/25.
//

import SwiftUI

struct HeaderView: View {
	
	
	// MARK: - properties
	
	var title: String? = nil
	
	// MARK: - body
	
	var body: some View {
		VStack {
			// title
			if let unwrappedTitle = title?.uppercased() { Text(unwrappedTitle)
					.font(.title3)
					.fontWeight(.bold)
					.foregroundColor(.accentColor)
			}
			
			// separator
			HStack {
				Capsule()
					.frame(height: 1)
				
				Image(systemName: "note.text")
				
				Capsule()
					.frame(height: 1)
			} // HStack
			.foregroundColor(.accentColor)
		} // VStack
	}
}


// MARK: - preview

struct HeaderView_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			HeaderView()
			HeaderView(title: "Credits")
		}
	}
}
