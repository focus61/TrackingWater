//
//  ContentView.swift
//  TrackingWater
//
//  Created by Aleksandr on 06.02.2024.
//

import SwiftUI

struct ContentView: View {

	@State private var showingSheet = false
	@State var waveOffset = Angle(degrees: .zero)

	var body: some View {
		ZStack {
			NavigationStack {
				ZStack {
					WaveShape(offSet: Angle(degrees: waveOffset.degrees), height: 0.37)
						.fill(Color.blue)
						.ignoresSafeArea(.all)
					WaveShape(offSet: Angle(degrees: waveOffset.degrees), height: 0.35)
						.fill(Color.teal)
						.ignoresSafeArea(.all)
					VStack {
						Spacer()
						Text("Welcome!\nLet's get to know each other better 🤗")
							.font(Font.system(size: 30))
							.multilineTextAlignment(.center)
							.padding()
						Spacer()
						Button(action: {
							showingSheet.toggle()
						}, label: {
							ZStack {
								RoundedRectangle(cornerRadius: Settings.cornerRadius)
									.frame(width: Settings.buttonWidth, height: Settings.buttonHeight)
									.foregroundStyle(.white)
									.shadow(radius: 10)
								Text("Let's go!").foregroundStyle(.black)
							}
						})
						.padding()
						.navigationDestination(isPresented: $showingSheet) {
							SecondView()
						}
					}
				}
			}
			.task {
				withAnimation(.linear(duration: 4.5).repeatForever(autoreverses: false)) {
					waveOffset = Angle(degrees: 360)
				}

			}
		}
	}
}

extension ContentView {

	enum Settings {

		static let buttonHeight: CGFloat = 60
		static let cornerRadius: CGFloat = 40
		static let buttonWidth: CGFloat = 300
	}
}

//
//struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
//}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
