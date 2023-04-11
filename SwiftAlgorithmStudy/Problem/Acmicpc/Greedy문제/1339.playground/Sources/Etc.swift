import Foundation

extension String {
    public func findIndex(from num: Int) -> String {
        guard num <= count, num >= 0 else {
            return ""
        }
        if num == 0 {
            return  String(self[self.startIndex])
        }
        
        let find = index(self.startIndex, offsetBy: num)
        return String(self[find])
    }
}
