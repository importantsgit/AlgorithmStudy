
var name = ["may", "kein", "kain", "radi"]
var yearing = [5, 10, 1, 3]
var photo = [["may"], ["kein", "deny", "may"], ["kon", "coni"]]

func solution(_ name: [String],_ yearing: [Int],_ photo: [[String]]) -> [Int] {
    var arr = [Int]()
    for people in photo {
        arr.append(
            people.reduce(0, {
            var idx = name.firstIndex(of: $1) ?? -1
            return idx != -1 ? $0 + yearing[idx] : $0
        }))
    }
    
    return arr
}

solution(name, yearing, photo)
