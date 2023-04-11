/*
 단어수학
 1339
 */


var arr: [[String]] = []


for i in 0..<n {
    arr.append(readLine()!.map{String($0)})
}


arr = [["A","F","A"],["A","D","C"],["G","A","F","A"]]
var maxCnt = arr[0].count
var arrs:[[String]] = [[String]](repeating: [], count: maxCnt)
print(arrs)

for i in (0..<maxCnt).reversed() {
    for item in arr {
        let j = item.count - (1 + i)
        if item.count > i {
            arrs[i].append(item[j])
        }
    }
}

//MARK: -

var n = Int(String(readLine()!))!
var stringArr:[String] = []
for _ in 0..<n {
    stringArr.append(String(readLine()!))
}

func aplhabetMath(arr: [String])->Int {
    var aplhabet:[Int] = [Int](repeating: 0, count: 26)
    var result = 0
    var multiple = 9
    
    for str in arr {
        var pos = 1
        for i in str.reversed() {
            aplhabet[Int(i.asciiValue! - Character("A").asciiValue!)] += pos
            pos *= 10
        }
    }
    aplhabet = aplhabet.filter({$0 != 0}).sorted(by: >)

    for i in aplhabet {
        result += multiple * i
        multiple -= 1
    }

    return result
}

print(aplhabetMath(arr: stringArr))
