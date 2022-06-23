//
//  FitnessCenter.swift
//  CodeStarterCamp_Week4
//
//  Created by Wonbi on 2022/05/23.
//

import Foundation

struct FitnessCenter {
    var name: String
    var upperBodyMuscleStrengthGoal: Int = 0
    var lowerBodyMuscleStrengthGoal: Int = 0
    var muscularEnduranceGoal: Int = 0
    let tirednessLimit: Int = 100
    var member: Person?
    var routineList: Array<Routine> = [upperRoutine, lowerRoutine, dietRoutine, hellRoutine]
    var selectedRoutineNumber: Int = 0
    var routineRepetition: Int = 0
    var numberOfTraining: Int = 0
    
    
    init (name: String) {
        self.name = name
    }
    
    mutating func registerMember() {
        var memberName: String
        print("안녕하세요! \(name) 피트니스 센터입니다. 회원님의 이름은 무엇인가요?")
        repeat {
            print("이름: ", terminator: "")
            memberName = ""
            reciveStringAndSolveError(&memberName)
        } while memberName.count == 0
        member = Person(name: memberName)
    }
    
    mutating func setUpUpperBodyMuscleStrengthGoal() {
        upperBodyMuscleStrengthGoal = 0
        repeat {
            print("상체근력: ", terminator: "")
            reciveIntAndSolveError(&upperBodyMuscleStrengthGoal, limit: 200)
        } while upperBodyMuscleStrengthGoal == 0
    }
    
    mutating func setUpLowerBodyMuscleStrengthGoal() {
        lowerBodyMuscleStrengthGoal = 0
        repeat {
            print("하체근력: ", terminator: "")
            reciveIntAndSolveError(&lowerBodyMuscleStrengthGoal, limit: 200)
        } while lowerBodyMuscleStrengthGoal == 0
    }
    
    mutating func setUpMuscularEnduranceGoal() {
        muscularEnduranceGoal = 0
        repeat {
            print("근지구력: ", terminator: "")
            reciveIntAndSolveError(&muscularEnduranceGoal, limit: 180)
        } while muscularEnduranceGoal == 0
    }
    
    mutating func settingGoals() {
        print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력: 130,하체근력: 120,근지구력: 150")
        setUpUpperBodyMuscleStrengthGoal()
        setUpLowerBodyMuscleStrengthGoal()
        setUpMuscularEnduranceGoal()
    }
    
    mutating func selectRoutine() {
        print("몇 번째 루틴으로 운동하시겠어요?")
        for i in 0..<routineList.count {
            print("\(i + 1).", "\(routineList[i].name)")
        }
        selectedRoutineNumber = 0
        repeat {
        print("번호: ", terminator: "")
        reciveIntAndSolveError(&selectedRoutineNumber, limit: routineList.count)
        } while selectedRoutineNumber == 0
    }
    
    mutating func selectRepetition() {
        print("몇 세트 반복하시겠어요?")
        routineRepetition = 0
        repeat {
            print("반복횟수: ", terminator: "")
            reciveIntAndSolveError(&routineRepetition, limit: 10)
        } while routineRepetition == 0
    }
    
    func isReachedGoal(who member: Person) -> Bool {
        if member.bodyCondition.upperBodyMuscleStrength >= upperBodyMuscleStrengthGoal,
           member.bodyCondition.lowerBodyMuscleStrength >= lowerBodyMuscleStrengthGoal,
           member.bodyCondition.musclerEndurance >= muscularEnduranceGoal {
            return true
        } else {
            return false
        }
    }
    
    func exerciseRoutine() throws {
        guard let member = member else {
            throw InputError.notRegistered
        }
        do {
            try member.exercise(for: routineRepetition, routine: routineList[selectedRoutineNumber - 1])
        }
        if !isReachedGoal(who: member) {
            throw exerciseResult.notEnoughGoal
        } else {
            throw exerciseResult.reachedGoal
        }
    }
    
    mutating func startExercise() {
        guard let member = member else {
            return
        }
        selectRoutine()
        selectRepetition()
        do {
            try exerciseRoutine()
        } catch InputError.notRegistered {
            print(InputError.notRegistered.errorMessege)
        } catch exerciseResult.overTiredness {
            print("""
                  --------------
                  \(member.name)님의 피로도가 \(member.bodyCondition.tiredness)입니다. 회원님이 도망갔습니다.
                  """)
        } catch exerciseResult.notEnoughGoal {
            print("""
                  --------------
                  목표치에 도달하지 못했습니다. 현재 \(member.name)님의 컨디션은 다음과 같습니다.
                  """)
            member.bodyCondition.checkCondition()
            print("--------------")
            numberOfTraining += 1
            if numberOfTraining >= 5 {
                print("오늘 트레이닝 횟수가 모두 소진되었습니다. 센터문을 닫습니다.")
            } else {
                startExercise()
            }
        } catch exerciseResult.reachedGoal {
            print("""
                  --------------
                  성공입니다! 현재 \(member.name)님의 컨디션은 다음과 같습니다.
                  """)
            member.bodyCondition.checkCondition()
        } catch {
            print("unknown Error: \(error)")
        }
    }
    
    mutating func openCenter() {
        registerMember()
        settingGoals()
        startExercise()
    }
}

