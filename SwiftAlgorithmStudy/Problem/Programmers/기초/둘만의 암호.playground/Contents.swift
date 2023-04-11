
var s = "aukks"
var skip = "wbqd"
var index = 5
var result = "happy"

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var result = ""
    var skip = skip.map{Character(String($0)).asciiValue!}
    var s = s.map{ (i) -> String in
        var word = i.asciiValue!
        var cnt = index
        while cnt != 0 {
            if skip.firstIndex(of: word) == nil {cnt -= 1}
            word += 1
            if word > Character("z").asciiValue! {word = Character("a").asciiValue!}
        }
        return String(Character(UnicodeScalar(word)))
    }
    return s.joined()
}
solution(s, skip, index)

func solution1(_ s:String, _ skip:String, _ index:Int) -> String {
    var aph = "abcdefghijklmnopqrstuvwxyz".map{ String($0) }.filter { !skip.contains($0) }
    //for remove in skip {aph.remove(at: aph.firstIndex(of: remove)!)}
    // 필터!!

//    var s = s.map{ (word)->String in
//        var word = word
//        var index = index
//        let idx = aph.firstIndex(of: word)!
//        var distance = aph.distance(from: aph.startIndex, to: idx)
//        while index != 0 {
//            index -= 1
//            distance += 1
//            if distance >= aph.count { distance = 0 }
//            word = aph[distance]
//        }
//        return String(word)
//    }
    
    return s.map{aph[aph.index(aph.firstIndex(of: String($0))!, offsetBy: index)%aph.count]}.joined()
}

solution1(s, skip, index)

// 와아...
// 값이 넘어갈 때는 % 쓰기
// 제거해야할 원소가 많을 경우 filter 쓰기
// Character(UnicodeScalar())을 쓰면 아스키코드를 다시 char형으로 변환가능
// abcdefghijklmnopqrstuvwxyz
