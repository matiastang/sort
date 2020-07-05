import Foundation

/*
 原始数组：[4, 2, 76, 82, 38, 74, 4, 0, 36, 4, 50, 64, 35, 71, 28, 19, 1, 57, 79, 30, 82, 89, 26, 7, 95, 13, 57, 81, 61, 50, 56, 9, 22, 1, 92, 76, 22, 27, 8, 98, 34, 39, 69, 47, 26, 59, 64, 25, 76, 40, 69, 20, 76, 11, 65, 9, 47, 86, 69, 7, 34, 52, 22, 70, 62, 59, 87, 51, 53, 71, 44, 19, 77, 51, 51, 29, 58, 87, 40, 27, 15, 84, 15, 86, 59, 2, 98, 82, 77, 10, 23, 19, 35, 15, 61, 48, 78, 21, 21, 77]
 开始时间：1593919595.6557941
 排序数组：[98, 98, 95, 92, 89, 87, 87, 86, 86, 84, 82, 82, 82, 81, 79, 78, 77, 77, 77, 76, 76, 76, 76, 74, 71, 71, 70, 69, 69, 69, 65, 64, 64, 62, 61, 61, 59, 59, 59, 58, 57, 57, 56, 53, 52, 51, 51, 51, 50, 50, 48, 47, 47, 44, 40, 40, 39, 38, 36, 35, 35, 34, 34, 30, 29, 28, 27, 27, 26, 26, 25, 23, 22, 22, 22, 21, 21, 20, 19, 19, 19, 15, 15, 15, 13, 11, 10, 9, 9, 8, 7, 7, 4, 4, 4, 2, 2, 1, 1, 0]
 结束时间：1593919599.818311
 耗时：4.162516832351685
 */

let lenght = 100
var originalArr = [Int]()
for _ in 0..<lenght {
    originalArr.append(Int(arc4random_uniform(100)))
}

let startTime = Date().timeIntervalSince1970
print("原始数组：\(originalArr)\n开始时间：\(startTime)")
let newArr = bubbleSort(&originalArr)
let endTime = Date().timeIntervalSince1970
print("排序数组：\(newArr)\n结束时间：\(endTime)\n耗时：\(endTime - startTime)")

/// 冒泡排序
/// - Parameter original: 待排序数组
/// - Returns: 已排序数组
func bubbleSort(_ original: inout [Int]) -> [Int] {
    let lenght = original.count
    for i in 0..<lenght {
        for j in 0..<lenght - i - 1 {
            if original[j] < original[j + 1] {
                original.exchange(j, j + 1)
            }
        }
    }
    return original
}


/// 交换数组元素
/// - Parameters:
///   - arr: 数组
///   - from: 交换元素下标
///   - to: 交换元素下标
func exchangeElement<T>(_ arr: inout [T], _ from: Int, _ to: Int) {
    (arr[from], arr[to]) = (arr[to], arr[from])
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
