//
//  CreateView.swift
//  Swiftly Chord Demo
//
//  © 2023 Nick Berendsen
//

import SwiftUI
import SwiftlyChordUtilities

struct CreateView: View {
    /// Chord Display Options
    @Environment(ChordDisplayOptions.self) private var chordDisplayOptions
    /// The body of the `View`
    var body: some View {
        @Bindable var chordDisplayOptions = chordDisplayOptions
        ScrollView {
            CreateChordView(chordDisplayOptions: $chordDisplayOptions)
                .padding()
        }
        .animation(.default, value: chordDisplayOptions.displayOptions)
        .task(id: chordDisplayOptions.displayOptions.instrument) {
            setDefinition()
        }
    }
    /// Set the definition
    private func setDefinition() {
        if let chord = ChordDefinition(name: "C", instrument: chordDisplayOptions.displayOptions.instrument) {
            chordDisplayOptions.definition = chord
        }
    }
}
