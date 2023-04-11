,var card1 = ["i","water","drink"]

var card2 = ["want","to"]

var goal = ["i","want","to","drink","water"]

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var goal = goal, cards1 = cards1, cards2 = cards2
    var FirstCard1 = cards1.removeFirst(), FirstCard2 = cards2.removeFirst()
    var result = "Yes"
    
    while goal.count != 0 {
        let target = goal.removeFirst()

        if target == FirstCard1 {
            FirstCard1 = !cards1.isEmpty ? cards1.removeFirst() : ""
            continue
        } else if target == FirstCard2 {
            FirstCard2 = !cards2.isEmpty ? cards2.removeFirst() : ""
            continue
        } else {
            result = "No"
            break
        }
    }
    return result
}

solution(card1, card2, goal)

extension String {
    func findStr(idx: Int) -> String {
        if idx < 0 || idx >= self.count {return ""}
        let findIdx = index(self.startIndex, offsetBy: idx)
        return String(self[findIdx])
    }
}

// 다시 확인
func solution1(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var result = "Yes"
    var targetIdx = 0, card1Idx = 0, card2Idx = 0
    
    while targetIdx != goal.count {
        if goal[targetIdx] == cards1[card1Idx] {
            cards1.count != card1Idx ? card1Idx + 1 : card1Idx
        } else if goal[targetIdx] == cards2[card2Idx] {
            cards2.count != card2Idx ? card2Idx + 1 : card2Idx
        } else {
            result = "No"
            break
        }
        targetIdx += 1
    }
    
    return result
}
solution1(card1, card2, goal)

