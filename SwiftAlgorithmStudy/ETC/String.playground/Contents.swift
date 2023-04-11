// Int형 인덱스로 만들기

extension String {
    public func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        // Index 값 획득
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유: endIndex는 문자열의 마지막 그 다음을 가리키기 때문
        
        // 파싱
        return String(self[startIndex ..< endIndex])
    }
    
    public func findIndex(from num: Int) -> String {
        guard num <= count, num >= 0 else {
            return ""
        }
        if num == 0 {
            return  String(self[self.startIndex])
        }
        
        let find = index(self.startIndex, offsetBy: num)
        return String(self[find])
    }
    
    public mutating func splitFrom(idx: Int)->String {
        if idx > self.count && idx < 0 { return self }
        var startIdx = index(self.startIndex, offsetBy: idx)
        var str = String(self[startIdx...])
        self = String(self[self.startIndex..<startIdx])
        return str
    }
}

// MARK: - 옵셔널 타입으로 안정성 UP
extension String {
    func findTo(_ i:Int)->String? {
        if i<0 || self.count<=i {print("findTo() function is not working");return nil}
        var idx = index(self.startIndex, offsetBy: i)
        return String(self[idx])
    }
    func splitTo(_ i:Int,from j:Int)->String? {
        if i<0 || j<i || self.count <= j {print("splitTo() function is not working");return nil}
        var startIdx = index(self.startIndex, offsetBy: i)
        var endIdx = index(self.startIndex, offsetBy: j)
        return String(self[startIdx...endIdx])
    }
}
