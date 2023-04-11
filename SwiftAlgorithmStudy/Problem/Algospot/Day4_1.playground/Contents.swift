// 캐시를 쓰기 (메모라이즈)
// 이렇게 풀면 나중에 문자열 길이가 길어질 경우가 있을때 어려움 -> 재귀로 풀기
var arr = ["12341234","11111222","12122222","22222222","12673939"]

func memo2(_ str:String,_ start: Int,_ end: Int) -> Int {
    var str2:String = str.substring(from: start, to: end)
    if str2.filter({$0 != Character(str2.findIndex(from: 0))}).isEmpty { return 1 } // 다 같은 경우
    var m:[Int] = []
    for i in (1..<str2.count).reversed() {m.append(Int(str2.findIndex(from: i))!-Int(str2.findIndex(from: i-1))!)}
    if m.filter({ $0 != 1}).isEmpty || m.filter({ $0 != -1}).isEmpty { return 2 } // 증감 1, -1
    if m.filter({$0 != m[0]}).isEmpty ||  m.filter({$0 != -m[0]}).isEmpty { return 5 } // 증감 m, -m
    var pos = 0
    while pos < str2.count - 2 {
        if str2.findIndex(from: pos) != str2.findIndex(from: pos+2) {break}
        pos += 1
    }
    if pos == str2.count - 2 { return 4 } // 번갈아 바뀔 때
    return 10
}


func PIMemorization(){

    for item in arr {
        var ret = 10000000
        for i in 2...4 {
            ret = min(ret,memo2(item,0,i) + memo2(item,i+1,7))
        }
        print(ret)
    }
    
}

//PIMemorization()


//

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
}

func getLevel(_ nums:String,_ start:Int,_ end:Int)->Int{
    var nums = nums.substring(from: start, to: end).map{Int(String($0))!}
    print(nums)
    if nums.filter({$0 != nums[0]}).isEmpty{return 1}
    var minus:[Int] = []
    for i in 1..<nums.count {minus.append(nums[i]-nums[i-1])}
    if minus.filter({$0 != minus[0]}).isEmpty {
        if minus[0] == 1 || minus[0] == -1 {return 2}
        return 5
    }
    var idx = 0
    repeat {
        if nums[idx] != nums[idx+2] {break}
        idx += 1
    } while idx < nums.count-2
    if idx==nums.count-2 {return 4}
    return 10
}

var cache = [Int](repeating: -1, count: 8)
func memo(_ str : String,_ start: Int)-> Int {
    if start == str.count {return 0}
    if cache[start] != -1 {return cache[start]}
    cache[start] = 100000000
    for i in 3...5 {
        if start + i <= str.count {
            cache[start] = min(cache[start], memo(str, start+i)+getLevel(str,start,start+i-1))
        }
    }
    return cache[start]
}

memo("12341234", 0)

print(cache)
