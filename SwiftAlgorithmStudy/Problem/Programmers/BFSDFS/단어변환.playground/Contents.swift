var begin = "hit"

var target = "cog"

var words = ["hot", "dot", "dog", "lot", "log", "cog"]

struct Queue {
    var queue = [(String, Int)?]()
    var idx = 0
    
    mutating func enqueue(item: (String, Int)){
        queue.append(item)
    }
    
    mutating func dequeue()->(String, Int)? {
        guard idx < queue.count,
              let item = queue[idx] else { return nil }
        queue[idx] = nil
        idx += 1
        if idx > 2 {
            queue.removeFirst(3)
            idx = 0
        }
        return item
    }
}

extension String {
    func find(_ idx: Int)->Character?{
        if idx < 0 || idx >= self.count {return nil}
        var i = index(self.startIndex, offsetBy: idx)
        
        return self[i]
    }
}

func checkWord(compare word1: String,to word2: String)->Bool{
    var num = 0
    for (idx, char) in word1.enumerated() {
        if let char2 = word2.find(idx)
            ,char != char2 {
            num += 1
        }
    }
    return num == 1 ? true:false
    
}

func BFS(begin:String, target:String, words: [String]) -> Int? {
    var queue = Queue()
    var visited = [Bool](repeating: false, count: words.count)
    queue.enqueue(item: (begin, 0))
    
    while let (word,depth) = queue.dequeue() {
        
        for (idx, w) in words.enumerated() {
            if !visited[idx], checkWord(compare: word, to: w) {
                if w == target {return depth+1}
                print(word, w)
                queue.enqueue(item: (w, depth+1))
                visited[idx] = true
            }
        }
    }
    
    return nil
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    guard let result = BFS(begin: begin, target: target, words: words) else {
        return 0
    }
    
    return result
}

solution(begin, target, words)
