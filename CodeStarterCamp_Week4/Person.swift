//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by Wonbi on 2022/05/20.
//

import Foundation

struct Person {
    let name: String
    var bodyCondition = BodyCondition()
    
    init(name: String) {
        self.name = name
    }
    
    func exercise(for set: Int, routine: Routine) throws {
        for i in 1...set {
            print("""
                  --------------
                  \(routine.name), \(i)set 시작합니다.
                  ...🏃🏻💦💦
                  """)
            for exerciseEvent in routine.routineContents {
                exerciseEvent.action(bodyCondition)
                if bodyCondition.tiredness >= 100 {
                    throw exerciseResult.overTiredness
                }
                print(exerciseEvent.name)
            }
        }
    }
}
