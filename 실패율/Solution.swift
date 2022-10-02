import Foundation

// N: 전체 스테이지의 개수
// stages: 사용자가 현재 멈춰있는 스테이지의 번호가 담긴 배열
func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    var challenger = stages.count
    var stages = stages
    stages.removeAll(where: { $0 == N + 1 })
    stages.sort(by: { $0 < $1 })
    
    return (1...N)
        .map { stageNum -> (stage: Int, failureRate: Float) in
            let firstIndex = stages.firstIndex(of: stageNum) ?? 0
            let lastIndex = stages.lastIndex(of: stageNum) ?? -1
            let incompleter = lastIndex - firstIndex + 1
            
            let result = (stageNum, (Float(incompleter) / Float(challenger)))
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
