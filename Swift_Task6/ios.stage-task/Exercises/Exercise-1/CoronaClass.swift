import Foundation

class CoronaClass {
  
  var seats = [Int]()
  let n : Int
  init(n: Int) {
    self.n = n
  }

  func seat() -> Int {
    guard n >= 1,
          n <= 100
    else { return -1 }
    
    var array: [Int] = []
    
    
    if seats.isEmpty {
      seats.append(0)
     // print("add aeat ->   \(seats)")
      return 0
    }
    // не проходит, если даляем первый элемент
    /*
     if seats.count == 1 {
      seats.append( n - 1 )
      print("add aeat ->   \(seats)")
      return n - 1
    }
     */
    //fix косяк если удаляются 1-q элемент
    if seats.first != 0 {
      seats.insert(0, at: 0)
     // print("add aeat ->   \(seats)")
      return 0
    }
    
    //fix косяк если удаляются последний элемент
    if seats.last != n - 1 {
      seats.append(n - 1)
      //print("add aeat ->   \(seats)")
      return n - 1
    }
   
    for i in 1..<seats.count{
      let value: Int =  seats[i] - seats[i - 1]
     // if seats[i + 1] - seats[i] != 0{
        array.append(value / 2)
      
      //нашли середины всех диапазонов
      //считаем слева, справа
    }
    
     // теперь максимально пустое место
      
      //let max = array.max()
      //смотрим како1 "подмассив"
      guard let max = array.max(),
            let index = array.firstIndex(of: max)
           // let seat  = seats[index]
      else {
        return -1
      }
      
     // let index = array.firstIndex(of: array.max()!) //разворачиваем, в массиве точно чтото есть
      
      // считаем номер сиденья
      let seat  = seats[index] + max
      seats.insert(seat, at: index + 1)
   // }
    
   // print("add aeat ->   \(seats)")
    return seat
  }
//  */
  func leave(_ p: Int) {
    seats.removeAll(where: {$0 == p})
    //print("remove aeat  nubmer \(p)->   \(seats)")
  }
}
