var T = "xxwwwbxwxwbbbwwxxxwwbbbwwwwbb"

func reverse(str: String, idx: Int) -> String {
    var idx = idx
    let char = str.findIndex(from: idx)
    idx += 1
    
    if char != "x" {
        return char
    }
    var sub:[String] = []
    for i in 0..<4 {
        sub.append(reverse(str: str, idx: idx))
        idx += sub[i].count
    }
    
    return char + sub[2] + sub[3] + sub[0] + sub[1]
}

//print(reverse(str: T, idx: 0))

//MARK: - 시험

func tree(idx: Int, str: String)->String {
    var nextIdx = idx+1
    var char = str.findChar(idx: idx)
    
    if char != "x" { return char }
    var splitStr:[String] = []
    
    // x를 만났을때
    for i in 0..<4 {
        splitStr.append(tree(idx: nextIdx, str: str))
        nextIdx += splitStr[i].count
    }
    return char+splitStr[2]+splitStr[3]+splitStr[0]+splitStr[1]
}

print(tree(idx: 0, str: "xxwwwbxwxwbbbwwxxxwwbbbwwwwbb"))

extension String {
    mutating func splitFrom(idx: Int)->String {
        if idx > self.count && idx < 0 { return self }
        var startIdx = index(self.startIndex, offsetBy: idx)
        var str = String(self[startIdx...])
        self = String(self[self.startIndex..<startIdx])
        return str
    }
    
    func findChar(idx: Int)->String {
        if idx > self.count && idx < 0 { return self }
        var findIdx = index(self.startIndex, offsetBy: idx)
        return String(self[findIdx])
    }
}
