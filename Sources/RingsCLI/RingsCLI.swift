//
//  Created by Artem Novichkov on 28.10.2023.
//

import SwiftUI
import Rings
import ArgumentParser

@main
struct RingsCLI: ParsableCommand {

    enum Error: Swift.Error {

        case noImageData
    }

    static let configuration = CommandConfiguration(abstract: "Generate a rings image.")

    @Option(name: [.short, .long], help: "A name for input image.")
    var inputFile: String

    @Option(name: [.short, .long], help: "A name for output image.")
    var outputFile: String

    @MainActor
    mutating func run() throws {
        let viewModel = try RingsViewModel(name: inputFile,
                                           date: .now,
                                           summaryPath: "summary.json")
        let ringsView = RingsView(viewModel: viewModel)
        let size = CGSize(width: 442, height: 100)
        guard let data = ringsView.makeImageData(size: size) else {
            throw Error.noImageData
        }

        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let imageURL = currentDirectoryURL.appendingPathComponent(outputFile)
        try data.write(to: imageURL)
    }
}

extension RingsCLI.Error: CustomStringConvertible {

    var description: String {
        switch self {
        case .noImageData:
            return "Failed to generate image data."
        }
    }
}
