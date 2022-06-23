//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let sitUp: Exercise = .sitUp
let squats: Exercise = .squats
let deadLift: Exercise = .deadLift
let benchPress: Exercise = .benchPress
let runningLongTime: Exercise = .runningLongTime
let activeRest: Exercise = .activeRest
let hellRoutine = Routine(name: "지옥의루틴", routineContents: [squats, squats, activeRest, benchPress, benchPress, activeRest, deadLift, deadLift, activeRest, sitUp, sitUp, activeRest, runningLongTime, activeRest])
let dietRoutine = Routine(name: "다이어트루틴", routineContents: [runningLongTime, activeRest, runningLongTime, activeRest])
let upperRoutine = Routine(name: "상체루틴", routineContents: [benchPress, benchPress, activeRest, sitUp, sitUp, activeRest, runningLongTime, activeRest])
let lowerRoutine = Routine(name: "하체루틴", routineContents: [squats, squats, activeRest, deadLift, deadLift, activeRest, runningLongTime, activeRest])

var yagom = FitnessCenter(name: "야곰")

yagom.openCenter()
