var today = "2022.05.19"

var terms = ["A 6", "B 12", "C 3"]

var privacies = ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]

func solution2(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var today = today.split(separator: ".").map{Int($0)!}
    today[0] -= 2000
    var todayNum = today[0]*28*12+today[1]*28+today[2]
    print(today)
    var arr = [Int]()
    
    for (idx,privacie) in privacies.enumerated() {
        var pri = privacie.split(separator: " ")
        var date = pri[0].split(separator: ".").map{Int($0)!}
        date[0] -= 2000
        print(date)
        var num = (todayNum - date[0]*28*12+date[1]*28+date[2])%12%28
        print(num)
        if let term = terms.first(where: { term in
            var term = term.split(separator: " ")
            return term[0] == pri[1] ? true : false
        }) {
            print(term)
            var t = Int(term.split(separator: " ")[1])!
            if (t) < num {
                arr.append(idx+1)
            }
        }
    }
    
    return arr
}

solution2(today, terms, privacies)
