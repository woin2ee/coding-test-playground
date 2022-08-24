import Foundation

struct PersonalityType {
    var r: UInt = 0
    var t: UInt = 0
    var f: UInt = 0
    var c: UInt = 0
    var m: UInt = 0
    var j: UInt = 0
    var a: UInt = 0
    var n: UInt = 0
    
    mutating func increase(score: UInt, of character: Character) {
        switch character {
        case "R":
            self.r += score
        case "T":
            self.t += score
        case "F":
            self.f += score
        case "C":
            self.c += score
        case "M":
            self.m += score
        case "J":
            self.j += score
        case "A":
            self.a += score
        case "N":
            self.n += score
        default:
            return
        }
    }
    
    mutating func apply(choice: Int, of survey: String) {
        let choiceScore = choice - 4
        switch choiceScore {
        case 0:
            return
        case -3, -2, -1:
            let char = survey[survey.startIndex]
            self.increase(score: choiceScore.magnitude, of: char)
        case 1, 2, 3:
            let index = survey.index(survey.startIndex, offsetBy: 1)
            let char = survey[index]
            self.increase(score: choiceScore.magnitude, of: char)
        default:
            return
        }
    }
    
    var result: String {
        let rt = r >= t ? "R" : "T"
        let fc = c >= f ? "C" : "F"
        let mj = j >= m ? "J" : "M"
        let an = a >= n ? "A" : "N"
        return "\(rt)\(fc)\(mj)\(an)"
    }
}

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var personalityType = PersonalityType.init()
    
    zip(survey, choices).map { $0 }
        .forEach { (survey, choice) in
            personalityType.apply(choice: choice, of: survey)
        }
        
    return personalityType.result
}
