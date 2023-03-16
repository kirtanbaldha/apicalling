import UIKit

struct Get:Codable {
    var userId : Int
    var id : Int
    var title : String
    var body : String
    
}

class ViewController: UIViewController {
    var arr : [Get] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
       
    }
    
    func getData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        var ur = URLRequest(url: url!)
        ur.httpMethod = "GET"
        URLSession.shared.dataTask(with: ur) { data, URLResponse, error in
            do{
                if error == nil{
                    self.arr = try JSONDecoder().decode([Get].self, from: data!)
                    print(self.arr)
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }.resume()
    }

}

