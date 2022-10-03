import Foundation

func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    var challenger = stages.count
    let incompleters = Dictionary.init(grouping: stages) { $0 }
    
    return (1...N)
        .map { stageNum -> (stage: Int, failureRate: Double) in
            let incompleter = incompleters[stageNum]?.count ?? 0
            let result = (stageNum, (Double(incompleter) / Double(challenger)))
            challenger -= incompleter
            return result
        }
        .sorted(by: {
            if $0.failureRate == $1.failureRate {
                return $0.stage < $1.stage
            } else {
                return $0.failureRate > $1.failureRate
            }
        })
        .map { $0.stage }
}
