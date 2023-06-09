/*
 2504
 괄호의 값
 */

struct Stack {
    private var stack = [String]()
    
    mutating func isEmpty()->Bool {
        stack.isEmpty
    }
    
    mutating func push(item: String){
        stack.append(item)
    }
    
    @discardableResult
    mutating func pop()->String? {
        guard !stack.isEmpty else {
            return nil
        }
        return stack.popLast()
    }
    
    mutating func compare(to char: String)->Bool {
        guard !stack.isEmpty else {return false}
        switch char {
        case "]":
            if stack.last == "[" {return true}
        case ")":
            if stack.last == "(" {return true}
        default:
            return false
        }
        return false
    }
}


extension String {
    func getChar(from idx: Int) -> String? {
        guard idx >= 0, idx < self.count else {
            return nil
        }
        let index = index(self.startIndex, offsetBy: idx)
        return String(self[index])
    }
}




func check(_ str: String) {
    var str = str
    var stack = Stack()
    var temp = 1
    var result = 0
    guard str.getChar(from: 0) == "[" ||
          str.getChar(from: 0) == "(" else {
        return
    }
    
    for i in 0..<str.count {
        if let char = str.getChar(from: i) {
            if char == "(" {
                temp *= 2
                stack.push(item: char)
            } else if char == "[" {
                temp *= 3
                stack.push(item: char)
            } else if char == "]" {
                if !stack.compare(to: char) {
                    print("0")
                    return
                }
                if str.getChar(from: i-1) == "[" {
                    result += temp
                }
                stack.pop()
                temp /= 3
                
            } else if char == ")" {
                if !stack.compare(to: char) {
                    print("0")
                    return
                }
                if str.getChar(from: i-1) == "(" {
                    result += temp
                }
                stack.pop()
                temp /= 2
            }
        }
    }
    
    if !stack.isEmpty() {
        print("0")
    } else {
        print(result)
    }
}

check("(()[[]])([])")


//
var parens = Array(readLine()!).map { String($0) }
var stack = [String]()
var result = 0
var isCorrect = true
var temp = 1

for i in parens.indices {
    
    if parens[i] == "(" {
        temp *= 2
        stack.append(parens[i])
    } else if parens[i] == "[" {
        temp *= 3
        stack.append(parens[i])
    } else if parens[i] == ")" {
        if stack.isEmpty || stack.last != "(" {
            isCorrect = false
            break
        }
        
        if parens[i-1] == "(" {
            result += temp
        }
        stack.removeLast()
        temp /= 2
    } else if parens[i] == "]" {
        if stack.isEmpty || stack.last != "[" {
            isCorrect = false
            break
        }
        
        if parens[i-1] == "[" {
            result += temp
        }
        stack.removeLast()
        temp /= 3
    }
}

if !isCorrect || !stack.isEmpty {
    print(0)
} else {
    print(result)
}


