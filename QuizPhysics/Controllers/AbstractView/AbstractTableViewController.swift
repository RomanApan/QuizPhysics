
import UIKit

class AbstractTableViewController: UIViewController {
    
    var abstractData: [DemoData] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let idAbstractCell = "idAbstractCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Коспекты"
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AbstractTableViewCell.self, forCellReuseIdentifier: idAbstractCell)
        
        if let localData = self.readLocalFile(forName: "dataAbstract") {
            self.parse(jsonData: localData, &abstractData)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension AbstractTableViewController {
    
    struct Meh: Codable {
        let meh: [DemoData]
    }
        
    struct DemoData: Codable {
        let title: String
        let description: String
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    private func parse(jsonData: Data, _ a: inout [DemoData]) {
        do {
            let decodedData = try JSONDecoder().decode(Meh.self, from: jsonData)
            
            for i in 0...decodedData.meh.count-1 {
                a.append(decodedData.meh[i])
            }
        } catch {
            print("decode error")
        }
    }
}


extension AbstractTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        abstractData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idAbstractCell, for: indexPath) as! AbstractTableViewCell
        
        cell.textLabel?.text = "\(abstractData[indexPath.row].title)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = AbstractViewController()
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        vc.indexP = indexPath.row
        vc.mainTitle = abstractData[indexPath.row].title
        vc.namePDF = abstractData[indexPath.row].description
    }
}
