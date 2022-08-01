import Foundation

// test case
let sales = [14, 17, 15, 18, 19, 14, 13, 16, 28, 17]
let links = [[10, 8], [1, 9], [9, 7], [5, 4], [1, 5], [5, 10], [10, 6], [1, 3], [10, 2]]

struct Member: Hashable {
    let id: Int
    let sale: Int
}

struct Team {
    let leader: Member
    let employees: [Member]
    var members: [Member] {
        var members = employees
        members.append(leader)
        return members
    }
}

func getAllCombinations(teams: [Team], count: Int, value: [Member], result: inout [[Member]]) {
    if count == 1 {
        teams[count - 1].members.forEach {
            var lastValue = value
            lastValue.append($0)
            result.append(lastValue)
        }
        return
    }

    teams[count - 1].members.forEach {
        var nextValue = value
        nextValue.append($0)
        getAllCombinations(teams: teams, count: count - 1, value: nextValue, result: &result)
    }
}

// solution
func solution(_ sales:[Int], _ links:[[Int]]) -> Int {
    let leaders = Set<Int>.init(links.map { $0[0] })

    let teams = leaders
        .map { leader -> Team in
                Team.init(
                    leader: Member.init(id: leader, sale: sales[leader - 1]),
                    employees: links
                        .filter { $0[0] == leader }
                        .map { Member.init(id: $0[1], sale: sales[$0[1] - 1]) }
                )
        }
    
    var allCombinations: [[Member]] = []
    getAllCombinations(teams: teams, count: teams.count, value: [], result: &allCombinations)

    return allCombinations
        .map { Set<Member>.init($0) }
        .map { members -> Int in
            members.reduce(0) { $0 + $1.sale }
        }
        .min() ?? -1
}
