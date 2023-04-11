/*
 15312
 이름 궁합
 */

func nameCompatibility(_ str1:String,_ str2:String){
    var str1=str1.map{ Int($0.asciiValue!) - 65 };var str2=str2.map{Int($0.asciiValue!)-65}
    var alphabet = [3,2,1,2,3,3,2,3,3,2,2,1,2,2,1,2,2,2,1,2,1,1,1,2,2,1],DP:[Int]=[]
    for i in 0..<str1.count{DP.append(alphabet[str1[i]]);DP.append(alphabet[str2[i]])}
    for i in 1..<DP.count - 1{for j in 0..<DP.count-i{DP[j]=(DP[j]+DP[j+1])%10}}
    print(DP[0]==0 ?"0\(DP[1])":DP[0]*10+DP[1])
}
nameCompatibility(readLine()!,readLine()!)

// A -> 65
