import UIKit

// 原始数组 --> 稀疏数组
//创建一个原始的二维数组 11 * 11
//0：表示没有棋子，1表示黑子 2表示白子

var row = 12

var column = 12

var chessArr = [[Int]](repeating: [Int](repeating: 0, count: column), count: row) //列 行
chessArr[1][2] = 1
chessArr[2][3] = 2
chessArr[3][4] = 4
chessArr[8][8] = 8
print("原始的二维数组：")
for row:[Int]  in chessArr {
    for data:Int  in row {
        //不换行打印，仅仅须要将最后一个參数赋值为空字符串就可以
        print("\(data) ", terminator: "")
    }
    print()//换行
}


//将二维数组 转 稀疏数组
//1.先遍历二位数组 得到非0数据的个数
var sum = 0
for i in 0..<row {
   for j in 0..<column {
    if chessArr[i][j] != 0 {
        sum += 1
     }
  }
}

//2.创建对应的稀疏数组
var sparseArr = [[Int]](repeating: [Int](repeating: 0, count:3), count: sum + 1) //列 行


// 给稀疏数组赋值
sparseArr[0][0] = row
sparseArr[0][1] = column
sparseArr[0][2] = sum

//遍历二维数组，将非0的值存放到sparseArr中
var count = 0 //用于记录是第几个非0数据
for i in 0..<row {
    for j in 0..<column {
        if chessArr[i][j] != 0 {
           count += 1
           sparseArr[count][0] = i
           sparseArr[count][1] = j
           sparseArr[count][2] = chessArr[i][j]
        }
    }
}

//输出稀疏数组的形式
print()
print("得到的稀疏数组------>")

for i in 0..<sparseArr.count {
   print("\(sparseArr[i][0])\t\(sparseArr[i][1])\t\(sparseArr[i][2])\t")
}
print()

//将稀疏数组 --> 回复成 原始的二维数组

/**
 1.先读取稀疏数组的第一行，根据第一行的数据，创建原始的二维数组，比如上面的 chessArr2 = int [row][column]
 2.在读取稀疏数组后几行的数据，并赋给原始的二维数组即可。
 */

//1.先读取稀疏数组的第一行，根据第一行的数据，创建原始的二维数组，
var chessArr2 = [[Int]](repeating: [Int](repeating: 0, count:sparseArr[0][1]), count: sparseArr[0][0]) //列 行
//2.在读取稀疏数组后几行的数据，并赋给原始的二维数组即可。
for i in 1..<sparseArr.count {
    chessArr2[sparseArr[i][0]][sparseArr[i][1]] = sparseArr[i][2]
}

//输出恢复后的二维数组
print()
print("恢复后的二维数组 ---- >")

for row:[Int]  in chessArr2 {
    for data:Int  in row {
        //不换行打印，仅仅须要将最后一个參数赋值为空字符串就可以
        print("\(data) ", terminator: "")
    }
    print()//换行
}


