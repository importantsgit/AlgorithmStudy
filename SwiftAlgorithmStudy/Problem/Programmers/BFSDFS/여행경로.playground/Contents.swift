var ticket = [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]

struct Queue {
    var queue = [String?]()
    var idx = 0
    
    mutating func enqueue(item: String) {
        queue.append(item)
    }
    
    mutating func dequeue() -> String? {
        guard queue.count > idx,
              let item = queue[idx] else {
                  return nil
              }
        queue[idx] = nil
        idx += 1
        
        if idx > 2 {
            queue.removeFirst(3)
            idx = 0
        }
        return item
    }
    
}

func DFS(start: String, index: Int, tickets: [[String]], re:[String] ,visited: inout [[String]]){

    if tickets.count == 1 {visited.append(re);return}
    var start = start,tickets = tickets,index = index,re = re
    if index != -1 {tickets.remove(at: index)}

    for (idx, ticket) in tickets.enumerated() {
        if ticket[0] == start {
            re.append(ticket[1])
            DFS(start: ticket[1], index: idx, tickets: tickets, re: re, visited: &visited)
            re.removeLast()
        }
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    var visited = [[String]]()
    DFS(start: "ICN", index: -1, tickets: tickets, re: ["ICN"], visited: &visited)
    return visited.sorted(by: { $0.joined() < $1.joined() }).first!
}

solution(ticket)
