//
//  Created by Artem Novichkov on 28.10.2023.
//

import SwiftUI

@Observable public class RingsViewModel {

    public let name: String
    public let date: Date
    public let activeEnergyBurned: Double
    public let activeEnergyBurnedGoal: Double
    public let appleStandHours: Double
    public let standHoursGoal: Double
    public let appleExerciseTime: Double
    public let exerciseTimeGoal: Double


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
