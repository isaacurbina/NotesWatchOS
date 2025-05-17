//
//  CreditsView.swift
//  NotesWatchOS Watch App
//
//  Created by Isaac Urbina on 5/17/25.
//

import SwiftUI

struct CreditsView: View {
	
	
	// MARK: - properties
	
	@State private var randomNumber: Int = Int.random(in: 1..<4)
	private var randomImage: String {
		return "developer-no\(randomNumber)"
	}
	
	
	// MARK: - body
	
	var body: some View {
		VStack(spacing: 3) {
			
			// profile image
			Image(randomImage)
				.resizable()
				.scaledToFit()
				.layoutPriority(1)
			
			// header
			HeaderView(title: "Credits")
			
			// content
			Text("Isaac Urbina")
				.foregroundColor(.primary)
				.fontWeight(.bold)
			Text("Developer")
				.font(.footnote)
				.foregroundColor(.secondary)
				.fontWeight(.light)
			
		} // VStack
	}
}


// MARK: - preview

struct CreditsView_Previews: PreviewProvider {
	static var previews: some View {
		CreditsView()
	}
}
