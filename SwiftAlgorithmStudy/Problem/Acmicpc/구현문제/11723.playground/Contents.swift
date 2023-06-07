/*
 11723
 집합
 */
var arr = [Int]()
for _ in 0..<Int(readLine()!)! {
    var order = readLine()!.split(separator: " ").map{String($0)}
    var str = order[0]
    switch str {
    case "add":
        arr.append(Int(order[1])!)
    case "remove":
        arr = arr.filter{Int(order[1])! != $0}
    case "check":
        print(arr.contains(Int(order[1])!) ? 1 : 0)
    case "toggle":
        if arr.contains(Int(order[1])!) { arr = arr.filter{Int(order[1])! != $0} } else { arr.append(Int(order[1])!) }
    case "all":
        arr = [Int](1...20)
    case "empty":
        arr  = []
    default: print("Error")
    }
}
