import UIKit
import Alamofire

struct Get:Codable {
    var userId : Int
    var id : Int
    var title : String
    var body : String
    
}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var dataTabel: UITableView!
    var arr : [Get] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
       
    }
    
//    func getData() {
//        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
//        var ur = URLRequest(url: url!)
//        ur.httpMethod = "GET"
//        URLSession.shared.dataTask(with: ur) { data, URLResponse, error in
//            do{
//                if error == nil{
//                    self.arr = try JSONDecoder().decode([Get].self, from: data!)
//                    print(self.arr)
//                    DispatchQueue.main.async {
//                        self.dataTabel.reloadData()
//                    }
//
//                }
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//        }.resume()
//    }
    func getData(){
        AF.request("https://jsonplaceholder.typicode.com/posts",method: .get).responseData { responce in
            switch responce.result{
                case.success(let data):
                    do{
                        if data == responce.value{
                                        self.arr = try JSONDecoder().decode([Get].self, from: data)
                                        print(self.arr)
                                        DispatchQueue.main.async {
                                            self.dataTabel.reloadData()
                                        }
                    
                                    }
                                }
                                catch{
                                    print(error.localizedDescription)
                                }
                case.failure(let error):
                    print(error.localizedDescription)
                    
                    
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dataTabel.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.label1.text = "\(arr[indexPath.row].userId)"
        cell.label2.text = arr[indexPath.row].title
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }

}

