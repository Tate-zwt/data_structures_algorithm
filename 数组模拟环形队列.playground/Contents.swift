import UIKit

class CircleArrayQueue{
    
    enum QueueError: Error {
        case empty
    }
    
    
    //队列的大小
    var maxSize:Int = 0
    //front就指向队列的第一个元素，也就是说arr[front]就是队列的第一个元素 front 的初始值为0
    var front:Int = 0
    //rear就指向队列的最后一个元素的后一个位置，因为希望能空出一个空间做为约定，也就是指向空出来的位置 rear 的初始值为0
    var rear:Int = 0
    var arr:[Int] = []
    
    init(maxSize : Int) {
        self.maxSize = maxSize
        self.arr = [Int] (repeating: 0, count:maxSize)
    }
    
    func isFull() -> Bool {
        return (rear + 1) % maxSize == front
    }
    
    func isEmpty() -> Bool {
           return rear == front
    }
    
    func addQueue(_ n:Int){
        if isFull() {
            print("队列满，不能加入数据~")
        }else{
            arr[rear] = n
            rear = (rear + 1) % maxSize
        }
    }
    
    func getQueue() throws -> Int {
           if isEmpty() {
            throw QueueError.empty
           }else{
               let value = arr[front]
               front = (front + 1) % maxSize
               return value
           }
       }
    
    func showQueue(){
        if isEmpty() {
         print("队列空的，没有数据~~")
        }else{
            for i in front..<front + size(){
                print("arr[\(i % maxSize)]=\(arr[i % maxSize])\n")
            }
        }
    }
    
    func size()  -> Int {
        
        return (rear + maxSize - front) % maxSize
    }
    
    
    
    func headQueue() throws -> Int {
        if isEmpty() {
         throw QueueError.empty
        }else{
            return arr[front]
        }
    }

    
}


//注意swift没有命令行的输入输出，只能调用C语言行数，下面只是示例

////测试数组模拟环形队列
//print("测试数组模拟环形队列的案例~~~")
//var queue = CircleArrayQueue(maxSize: 4); //实际上只有3个元素可以存放，有一个是空出来的
//var scanner =   Scanner()
//var loop = true
//
//while(loop) {
//           print("s(show): 显示队列");
//           print("e(exit): 退出程序");
//           print("a(add): 添加数据到队列");
//           print("g(get): 从队列取出数据");
//           print("h(head): 查看队列头的数据");
//           let key = scanner.string;
//           var res:Int;
//           switch(key) {
//           case "a":
//               print("输出一个数");
//               let value = scanner.string;
//               queue.addQueue(Int(value)!);
//               break;
//           case "e":
//               loop = false;
//               break;
//           case "g":
//            do {
//                  try res = queue.getQueue();
//                  print("取出的数据是%d\n", res);
//            } catch{
//                   print(error);
//            }
//               break;
//           case "h":
//               do {
//                   try res = queue.headQueue();
//                   print("队列头的数据是%d\n", res);
//               } catch{
//                   print(error);
//               }
//               break;
//           case "s":
//               queue.showQueue();
//            break
//           default: break
//
//    }
//
//}
//print("程序退出~~");

      


