// Design init은 Swift의 초기화 이니셜라이져
// convenience init은 Design init의 보조 이니셜라이져

class app<Int> {
    var a: Int
    var b: Int
    var name: String
    
    init(a: Int, b: Int, name: String) {
        self.a = a
        self.b = b
        self.name = name
    }
    
    convenience init(a: Int, b: Int) {
        self.init(a: a, b: b, name: "lee")
    }
    
    func printClass() {
        print("\(self.a) \(self.b) \(self.name)")
    }
}

// 사실 그냥 이렇게 지정해도 될듯
class app1<Int> {
    var a: Int
    var b: Int
    var name: String
    
    init(a: Int, b: Int, name: String = "lee") {
        self.a = a
        self.b = b
        self.name = name
    }
    
    func printClass() {
        print("\(self.a) \(self.b) \(self.name)")
    }
}

let a1 = app(a: 1, b: 2)
let a2 = app1(a: 1, b: 2)

a1.printClass()
a2.printClass()
// 결과값은 똑같이 나옴
