import UIKit



class Node {
    var leftNode: Node?
    var name: String
    var start: Int
    var playTime: Int
    
    init (_ name: String,_ start: Int,_ playTime: Int) {
        self.name = name
        self.start = start
        self.playTime = playTime
    }
}


var plans = [["korean", "11:40", "30"], ["english", "12:10", "20"], ["math", "12:30", "40"]]

func solution(_ plans:[[String]]) -> [String] {
    var plans = plans
    var stack = [Node]()
    
    plans.sort(by: {$0[1]<$1[1]})
    while
    
    print(plans)
    return []
}

solution(plans)
