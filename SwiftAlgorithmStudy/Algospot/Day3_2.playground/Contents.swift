var arr = [["he?p","help"],["he?p","heap"],["he?p","helpp"],["*p*","help"],["*p*","papa"],["*p*","hello"],["a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a", "ahfjsdhfjkdshfkjdshfkdsaojajfjaljaflkajflkdsaljflkaflsaffasfa54656454aafasfsdafsaaaaaaaaaaaaaaaaaaaa"],["******a","abcdea"]]

//MARK: - 와일드 카드 함수

func wildCard(compare arr1: String,with arr2: String)->Bool {
    let c1 = arr1.count - 1, c2 = arr2.count - 1
    var char: Character = "A", compare: Character = "A"
    var s1 = 0, s2 = 0 // 인덱스
    
    while s2 <= c2 && s1 <= c1 {
        char = arr1[arr1.index(arr1.startIndex, offsetBy: s1)]; compare = arr2[arr2.index(arr2.startIndex, offsetBy: s2)]
        if char == "*" { // *일 경우
            if c1 == s1 { return true } // 마지막에 *이 붙은 경우
            if arr1[arr1.index(arr1.startIndex, offsetBy: s1+1)] == compare { s1 += 2 } // * 다음문자가 compare과 같다면
            s2 += 1
            continue
        } else if char != compare && char != "?" { return false }  // 일치하지 않으면 false 리턴
        s1 += 1
        s2 += 1
    }

    if s1 == c1+1 && s2 == c2+1 { return true }
    // s2가 다 돌았지만 s1의 공간이 남았을 때 (** 같은 문자는 존재하지 않음)
    if char == "*" && s2 == c2+1 && c1 == s1 { return true }
    
    return false
}
// 안되는 케이스: a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a / ******a

//MARK: - 2번째
func wildCard2(str1: String, str2: String, idx1: Int, idx2: Int)->Bool{
    var idx1 = idx1, idx2 = idx2

    if str1.count <= idx1 && str2.count > idx2 { return false } // 비교할 문자열 순환 끝났을때
    if str1.count > idx1 && str2.count == idx2 && str1.count - idx1 > 1 { return str1.substring(from: idx1, to: str1.count-1).filter({ $0 != "*" }).isEmpty }
    // *xN 만 남았을때 true / 다른 문자가 남았을때 false
    if (str1.count <= idx1 && str2.count <= idx2) || (str1.count - idx1 == 1 && str1.last == "*") { return true }   // 두 문자열 순환이 끝났을때
    
    if str1.findIndex(from: idx1) == str2.findIndex(from: idx2) || str1.findIndex(from: idx1) == "?" {
        idx1 += 1
        idx2 += 1
        if wildCard2(str1: str1, str2: str2, idx1: idx1, idx2: idx2) { return true }
    } else if str1.findIndex(from: idx1) == "*" {
        for i in 0..<str2.count - idx2 { if wildCard2(str1: str1, str2: str2, idx1: idx1+1, idx2: i+idx2) { return true } }
    }
    return false
}

//MARK: - 3번째 ** 만 있다면
enum MyError: Error {
    case noValue
}

func checkStar(compare s1: String,with s2: String) -> Bool {
    var str2 = s2
    var arr = s1.split(separator: "*")
    for item in arr {
        guard let index = str2.firstRange(of: item) else { return false }
        str2 = String(str2[index.upperBound...])
    }
    return true
}



//MARK: - 플레이
enum wildStatus {
    case brute
    case recursion
}

func printWildCard(status: wildStatus, compare arr: [[String]]){
    var strings: [String] = []
    switch status {
    case .brute:
        for item in arr {
            if !item[0].contains(where: {$0=="?"}) && checkStar(compare: item[0], with: item[1]) {
                strings.append(item[1])
            } else if wildCard(compare: item[0], with: item[1]) {
                strings.append(item[1])
            }
        }
        print("Brute")

    case .recursion:
        for item in arr {
            if !item[0].contains(where: {$0=="?"}) && checkStar(compare: item[0], with: item[1]) {
                strings.append(item[1])
            } else if wildCard2(str1: item[0], str2: item[1], idx1: 0, idx2: 0) {
                strings.append(item[1])
            }
        }
        print("Recursion")
    }
    strings.sort(by: <)
    print(strings)
    print("\n\n")
}

//if checkStar(compare: arr[6][0], with: arr[6][1]) {
//   print("checkStar\n\n")
//}
//
//printWildCard(status: .brute, compare: arr)
//printWildCard(status: .recursion, compare: arr)


//MARK: - 와일드 카드 정답

func wildCard3(str1: String, str2: String, idx1: Int, idx2: Int)->Bool{
    var idx1 = idx1, idx2 = idx2

    if str1.count <= idx1 && str2.count > idx2 { return false } // 비교할 문자열 순환 끝났을때
    if str1.count > idx1 && str2.count == idx2 && str1.count - idx1 > 1 { return str1.substring(from: idx1, to: str1.count-1).filter({ $0 != "*" }).isEmpty }
    // *xN 만 남았을때 true / 다른 문자가 남았을때 false
    if (str1.count <= idx1 && str2.count <= idx2) || (str1.count - idx1 == 1 && str1.last == "*") { return true }   // 두 문자열 순환이 끝났을때
    while str1.count <= idx1 || str2.count <= idx2 {
        idx1 += 1
        idx2 += 1
    }
    
    if str1.findIndex(from: idx1) == str2.findIndex(from: idx2) || str1.findIndex(from: idx1) == "?" {
        idx1 += 1
        idx2 += 1
        if wildCard2(str1: str1, str2: str2, idx1: idx1, idx2: idx2) { return true }
    } else if str1.findIndex(from: idx1) == "*" {
        for i in 0..<str2.count - idx2 { if wildCard2(str1: str1, str2: str2, idx1: idx1+1, idx2: i+idx2) { return true } }
    }
    return false
}

//MARK: - 시험
var str1 = "he?p"
var str2 = "help"
var strs = [str1,str2]
var cache = [[Int]](repeating: [Int](repeating: -1, count: strs[1].count+1), count: strs[0].count+1)

extension String {
    func findTo(_ i: Int)-> String {
        if i<0 || self.count<i {return ""}
        var idx = index(self.startIndex, offsetBy: i)
        return String(self[idx])
    }
}

func wildCard(_ strs:[String],_ w: Int,_ s:Int)->Bool {
    var w=w,s=s
    var ret = cache[w][s]
    if ret != -1 {return ret==1}
    while w<strs[0].count && s<strs[1].count && (strs[0].findTo(w)==strs[1].findTo(s) || strs[0].findTo(w)=="?") {w+=1;s+=1}
    if w == strs[0].count {
        cache[w][s] = s == strs[1].count ? 1 : 0
        return s == strs[1].count
    }
    if strs[0].findTo(w)=="*"{
        for i in 0...strs[1].count-s {
            if wildCard(strs, w+1, s+i) {
                cache[w][s] = 1
                return true
            }
        }
    }
    cache[w][s] = 0
    return false
}

print(wildCard(strs, 0, 0))
