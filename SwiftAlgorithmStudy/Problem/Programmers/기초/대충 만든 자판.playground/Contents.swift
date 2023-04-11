var keymap = ["AA"]//["ABACD", "BCEFD"]
var targets = ["B"]//["ABCD","AABB"]

func solution1(_ keymap:[String], _ targets:[String]) -> [Int] {
    var arr = [Int]()
    
    for i in 0..<targets.count {
        var appendNum = 0
        for j in targets[i] { // forEach를 사용할 수 있다
            var cnt = keymap.map{
                if let firstIdx = $0.firstIndex(of: j) {
                    return $0.distance(from: $0.startIndex, to: firstIdx) + 1
                } else {
                    return 101
                }
            }.min()!
            
            if cnt == 101 {
                appendNum = -1
                break
            }
            appendNum += cnt
        }
        arr.append(appendNum)
    }
    return arr
}

solution1(keymap, targets)

// 배열의 모든 경우를 돌릴려면 reduce보다는 map을 사용하자
