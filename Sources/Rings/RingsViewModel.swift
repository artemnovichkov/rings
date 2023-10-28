//
//  Created by Artem Novichkov on 28.10.2023.
//

import SwiftUI

public class RingsViewModel: ObservableObject {

    enum Error: Swift.Error {

        case noSummaryData
    }

    @Published public var name: String
    @Published public var date: Date
    @Published public var activitySummary: ActivitySummary

    public init(name: String,
                date: Date,
                summaryPath: String) throws {
        self.name = name
        self.date = date
        guard let summaryPath = Bundle.module.path(forResource: summaryPath, ofType: nil) else {
            throw Error.noSummaryData
        }
        let summaryURL = URL(fileURLWithPath: summaryPath)
        let data = try Data(contentsOf: summaryURL)
        self.activitySummary = try JSONDecoder().decode(ActivitySummary.self, from: data)
    }
}

extension RingsViewModel.Error: CustomStringConvertible {

    var description: String {
        switch self {
        case .noSummaryData:
            return "Failed to get summary data."
        }
    }
}
