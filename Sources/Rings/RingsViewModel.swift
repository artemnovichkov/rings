//
//  Created by Artem Novichkov on 28.10.2023.
//

import SwiftUI

public class RingsViewModel: ObservableObject {

    @Published public var name: String
    @Published public var date: Date
    @Published public var activeEnergyBurned: Double
    @Published public var activeEnergyBurnedGoal: Double
    @Published public var appleStandHours: Double
    @Published public var standHoursGoal: Double
    @Published public var appleExerciseTime: Double
    @Published public var exerciseTimeGoal: Double


    public init(name: String,
                date: Date,
                activeEnergyBurned: Double,
                activeEnergyBurnedGoal: Double,
                appleStandHours: Double,
                standHoursGoal: Double,
                appleExerciseTime: Double,
                exerciseTimeGoal: Double) {
        self.name = name
        self.date = date
        self.activeEnergyBurned = activeEnergyBurned
        self.activeEnergyBurnedGoal = activeEnergyBurnedGoal
        self.appleStandHours = appleStandHours
        self.standHoursGoal = standHoursGoal
        self.appleExerciseTime = appleExerciseTime
        self.exerciseTimeGoal = exerciseTimeGoal
    }
}
