//
//  Created by Artem Novichkov on 28.10.2023.
//

import Foundation

public struct ActivitySummary: Decodable {

    public var activeEnergyBurned: Double
    public var activeEnergyBurnedGoal: Double
    public var appleStandHours: Double
    public var standHoursGoal: Double
    public var appleExerciseTime: Double
    public var exerciseTimeGoal: Double

    public init(activeEnergyBurned: Double,
                activeEnergyBurnedGoal: Double,
                appleStandHours: Double,
                standHoursGoal: Double,
                appleExerciseTime: Double,
                exerciseTimeGoal: Double) {
        self.activeEnergyBurned = activeEnergyBurned
        self.activeEnergyBurnedGoal = activeEnergyBurnedGoal
        self.appleStandHours = appleStandHours
        self.standHoursGoal = standHoursGoal
        self.appleExerciseTime = appleExerciseTime
        self.exerciseTimeGoal = exerciseTimeGoal
    }
}
