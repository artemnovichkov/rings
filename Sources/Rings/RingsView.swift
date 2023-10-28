//
//  Created by Artem Novichkov on 28.10.2023.
//

import SwiftUI
import AppKit

public struct RingsView: View {

    @State private var viewModel: RingsViewModel

    public init(viewModel: RingsViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack(spacing: 16) {
                Image(packageResource: viewModel.name, ofType: nil)
                    .resizable()
                    .frame(width: 92, height: 92, alignment: .center)
                VStack(alignment: .leading) {
                    energy
                    exercise
                    standHours
                }
                .font(.largeTitle)
                Spacer()
            }
            Group {
                Text("Updated at: ") + Text(viewModel.date, format: .dateTime)
            }
            .font(.caption)
        }
        .padding()
    }

    private var energy: some View {
        value(viewModel.activitySummary.activeEnergyBurned, viewModel.activitySummary.activeEnergyBurnedGoal, units: "kcal")
            .foregroundStyle(Color.init(nsColor: .systemRed))
    }

    private var exercise: some View {
        value(viewModel.activitySummary.appleExerciseTime, viewModel.activitySummary.exerciseTimeGoal, units: "min")
            .foregroundStyle(Color.init(nsColor: .systemGreen))
    }

    private var standHours: some View {
        value(viewModel.activitySummary.appleStandHours, viewModel.activitySummary.standHoursGoal, units: "hrs")
            .foregroundStyle(Color.init(nsColor: .systemCyan))
    }

    private func value(_ lhs: Double, _ rhs: Double, units: String) -> some View {
        Text("\(Int(lhs))/\(Int(rhs))" + units)
    }
}

struct RingsView_Previews: PreviewProvider {

    static var previews: some View {
        let viewModel = try! RingsViewModel(name: "rings.png",
                                            date: .now,
                                            summaryPath: "summary.json")
        return RingsView(viewModel: viewModel)
            .previewLayout(.fixed(width: 422, height: 100))
    }
}
