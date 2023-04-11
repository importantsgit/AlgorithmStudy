/*
 1874
 스택 수열
 */


var n = Int(readLine()!)!
var nums:[Int] = []
//for _ in 0..<n {
//    nums.append(Int(readLine()!)!)
//}
//var insert = 0, idx = 0, str = "", stack:[Int] = []
//
//repeat {
//    if nums[idx] > insert {
//        insert += 1
//        stack.append(insert)
//        str += "+\n"
//    } else if nums[idx] <= insert {
//        if !stack.contains(nums[idx]) {print("NO");break}
//        str += "-\n"
//        if nums[idx] == stack.popLast() {
//            idx += 1
//            if nums.count == idx {print(str);break}
//        }
//
//    }
//} while true


var stack=[Int]()
var p=0
var result = ""
for _ in 0..<Int(readLine()!)!{
    var value = Int(readLine()!)!
    if value > p {
        for i in p+1...value{
            stack.append(i)
            result += "+\n"
        }
        p = value
    }else if stack.last! != value{
        result = "NO"
        break
    }
    stack.popLast()!
    result += "-\n"
}
print(result)
