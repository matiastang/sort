import Foundation

/*
 原始数组：[35, 2, 77, 71, 79, 20, 25, 19, 92, 80, 77, 84, 75, 5, 97, 22, 83, 97, 30, 4, 73, 72, 11, 55, 81, 31, 47, 84, 72, 84, 41, 53, 75, 33, 96, 73, 97, 46, 23, 57, 12, 0, 64, 4, 23, 1, 21, 63, 6, 77, 35, 76, 14, 86, 73, 18, 37, 17, 90, 94, 77, 47, 86, 56, 7, 93, 70, 39, 68, 34, 3, 54, 12, 84, 71, 50, 34, 64, 33, 15, 69, 84, 79, 96, 89, 79, 97, 33, 77, 28, 28, 55, 25, 39, 65, 89, 92, 41, 8, 41]
 开始时间：1593922101.757549
 排序数组：[0, 1, 2, 3, 4, 4, 5, 6, 7, 8, 11, 12, 12, 14, 15, 17, 18, 19, 20, 21, 22, 23, 23, 25, 25, 28, 28, 30, 31, 33, 33, 33, 34, 34, 35, 35, 37, 39, 39, 41, 41, 41, 46, 47, 47, 50, 53, 54, 55, 55, 56, 57, 63, 64, 64, 65, 68, 69, 70, 71, 71, 72, 72, 73, 73, 73, 75, 75, 76, 77, 77, 77, 77, 77, 79, 79, 79, 80, 81, 83, 84, 84, 84, 84, 84, 86, 86, 89, 89, 90, 92, 92, 93, 94, 96, 96, 97, 97, 97, 97]
 结束时间：1593922102.682063
 耗时：0.9245140552520752
 */

let lenght = 100
var originalArr = [Int]()
for _ in 0..<lenght {
    originalArr.append(Int(arc4random_uniform(100)))
}

let startTime = Date().timeIntervalSince1970
print("原始数组：\(originalArr)\n开始时间：\(startTime)")
let newArr = shellSort(&originalArr)
let endTime = Date().timeIntervalSince1970
print("排序数组：\(newArr)\n结束时间：\(endTime)\n耗时：\(endTime - startTime)")

/// 希尔排序
/// - Parameter original: 待排序数组
/// - Returns: 已排序数组
func shellSort(_ original: inout [Int]) -> [Int] {
    let lenght = original.count
    var gapNumber:Int = Int(floor(Double(lenght / 2)))
    while gapNumber > 0 {
        for i in gapNumber..<lenght {
            var j = i
            let current = original[i]
            while j - gapNumber >= 0 && current < original[j - gapNumber] {
                original.exchange(j, j - gapNumber)
                j = j - gapNumber
            }
            original[j] = current
        }
        gapNumber = Int(floor(Double(gapNumber / 2)))
    }
    return original
}

extension Array {
    
    /// 交换数组元素
    /// - Parameters:
    ///   - from: 交换元素下标
    ///   - to: 交换元素下标
    /// - Returns: 交换后的元素
    mutating func exchange(_ from: Int, _ to: Int) -> Array {
        (self[from], self[to]) = (self[to], self[from])
        return self
    }
}
