//
//  SecondView.swift
//  TrackingWater
//
//  Created by Aleksandr on 05.02.2024.
//

import SwiftUI

struct SecondView: View {
	@Environment(\.dismiss) var dismiss

	var body: some View {
		Button("Press to dismiss") {
			dismiss()
		}
		.font(.title)
		.padding()
		.background(.black)
	}

}

#Preview {
	SecondView()
}
