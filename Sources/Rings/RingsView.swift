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
                    Text("\(viewModel.activeEnergyBurned, specifier: "%.0f")/\(viewModel.activeEnergyBurnedGoal, specifier: "%.0f")kcal")
                        .foregroundStyle(Color.init(nsColor: .systemRed))
                    Text("\(viewModel.appleExerciseTime, specifier: "%.0f")/\(viewModel.exerciseTimeGoal, specifier: "%.0f")min")
                        .foregroundStyle(Color.init(nsColor: .systemGreen))
                    Text("\(viewModel.appleStandHours, specifier: "%.0f")/\(viewModel.standHoursGoal, specifier: "%.0f")hrs")
                        .foregroundStyle(Color.init(nsColor: .systemCyan))
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
}

struct RingsView_Previews: PreviewProvider {

    static var previews: some View {
        let viewModel = RingsViewModel(name: "rings.png",
                                       date: .now,
                                       activeEnergyBurned: 424,
                                       activeEnergyBurnedGoal: 300,
                                       appleStandHours: 9,
                                       standHoursGoal: 10,
                                       appleExerciseTime: 38,
                                       exerciseTimeGoal: 30)
        return RingsView(viewModel: viewModel)
            .previewLayout(.fixed(width: 422, height: 100))
    }
}
