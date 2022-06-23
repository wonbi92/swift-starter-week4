//
//  Error.swift
//  CodeStarterCamp_Week4
//
//  Created by Wonbi on 2022/05/28.
//

import Foundation

enum exerciseResult: Error {
    case overTiredness
    case notEnoughGoal
    case reachedGoal
}

enum InputError: Error {
    case invalidString
    case invalidInt
    case notInt
    case exceededInt
    case notRegistered

    
    var errorMessege: String {
        switch self {
        case .invalidString:
            return "정확한 이름을 입력하세요."
        case .invalidInt:
            return "숫자를 입력해주세요."
        case .notInt:
            return "1 이상의 숫자만 입력 가능합니다."
        case .exceededInt:
            return "이하로 입력해주세요."
        case .notRegistered:
            return "등록을 먼저 진행해주세요."
        }
    }
}

func reciveStringValue() throws -> String {
    guard let inputedValue = readLine() else {
        throw InputError.invalidString
    }
    guard inputedValue != "" else {
        throw InputError.invalidString
    }
    return inputedValue
}

func reciveStringAndSolveError(_ result: inout String) {
    do {
        try result = reciveStringValue()
    } catch InputError.invalidString {
        print(InputError.invalidString.errorMessege)
    } catch {
        print("unknown Error: \(error)")
    }
}

func reciveIntValue(limit: Int) throws -> Int{
    guard let inputedValue = readLine() else {
        throw InputError.invalidInt
    }
    guard inputedValue != "" else {
        throw InputError.invalidInt
    }
    guard let convertedValue = Int(inputedValue) else {
        throw InputError.notInt
    }
    guard convertedValue != 0 else {
        throw InputError.notInt
    }
    guard convertedValue <= limit else {
        throw InputError.exceededInt
    }
    return convertedValue
}

func reciveIntAndSolveError(_ result: inout Int, limit: Int) {
    do {
         result = try reciveIntValue(limit: limit)
    } catch InputError.invalidInt {
        print(InputError.invalidInt.errorMessege)
    } catch InputError.notInt {
        print(InputError.notInt.errorMessege)
    } catch InputError.exceededInt {
        print(limit, InputError.exceededInt.errorMessege)
    } catch {
        print("unknown Error: \(error)")
    }
}
