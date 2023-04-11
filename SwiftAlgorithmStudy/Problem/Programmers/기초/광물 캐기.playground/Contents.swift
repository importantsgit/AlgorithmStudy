var picks = [1, 3, 2]
var minerals = ["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone"]


func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var min = minerals.map{
        var num = 0
        switch $0 {
        case "diamond": num = 2
        case "stone": num = 1
        default: num = 0
        }
        return num
    }
    print(min)
    return 0
}

solution(picks, minerals)
