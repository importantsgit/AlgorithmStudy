
func re(_ n:Int,_ jump:Int) -> String {
    var jumpingStr = jumping(jump)
    var str = ""
    if n == 0 {
        return "\(jumpingStr)"+#""재귀함수가 뭔가요?""#+"\n\(jumpingStr)"+#""재귀함수는 자기 자신을 호출하는 함수라네""#+"\n\(jumpingStr)라고 답변하였지."
    }
    str = "\(jumpingStr)"+#""재귀함수가 뭔가요?""#+"\n\(jumpingStr)"+#""잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어."#+"\n\(jumpingStr)마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지."+"\n\(jumpingStr)"+#"그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.""#
    
    return str+"\n\(re(n-1, jump+1))\n\(jumpingStr)라고 답변하였지."
}

func jumping(_ num:Int)->String{
    var str = ""
    for _ in 0..<num {
        str += "____"
    }
    return str
}

print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.\n"+re(Int(readLine()!)!, 0))


// 이 방법도 있음
let l = String(repeating: "____", count: 2) // 2번 반복

let n = Int(readLine()!)!
func re(_ num:Int) -> String {
    var l = String(repeating: "____", count: n-num)
    var str = ""
    if num == 0 {
        return "\(l)"+#""재귀함수가 뭔가요?""#+"\n\(l)"+#""재귀함수는 자기 자신을 호출하는 함수라네""#+"\n\(l)라고 답변하였지."
    }
    str = "\(l)"+#""재귀함수가 뭔가요?""#+"\n\(l)"+#""잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어."#+"\n\(l)마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지."+"\n\(l)"+#"그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.""#
    
    return str+"\n\(re(num-1))\n\(l)라고 답변하였지."
}

print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.\n"+re(Int(readLine()!)!))

#"  이런 것도 가능하지만 " "#
"이런 것도 있다는 것 명심하기 \" "
