import UIKit

class QuizTableViewController: UIViewController {
    
    struct Meh: Codable {
        let meh: [Categories]
    }
    
    struct Categories: Codable {
        let title: String
        let categor: [DemoData]
    }
        
    struct DemoData: Codable {
        let question: String
        let image: String
        let win: String
        let button1: String
        let button2: String
        let button3: String
        let button4: String
    }
    
    var quizData: [Categories] = []
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    let idQuizCell = "idQuizCell"
    
    var rounds: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Квиз"
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(QuizTableViewCell.self, forCellReuseIdentifier: idQuizCell)
        
        if let localData = self.readLocalFile(forName: "dataQuiz") {
            self.parse(jsonData: localData, &quizData)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
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
    
    private func parse(jsonData: Data, _ a: inout [Categories]) {
        do {
            let decodedData = try JSONDecoder().decode(Meh.self, from: jsonData)
            for i in 0...decodedData.meh.count-1 {
                a.append(decodedData.meh[i])
            }
        } catch {
            print("decode error")
        }
    }
    
    // функция по вызову оповещения о начале игры
    private func gameAlertIsStart(indexPath: IndexPath) {
        let alert = UIAlertController(
            title: "Тест начинается",
            message: "Укажите сколько задач вы хотите решить",
            preferredStyle: .alert)
        alert.addTextField { textField in
            textField.keyboardType = .numberPad
            textField.placeholder = "Введите число"
        }
        alert.addAction(UIAlertAction(
                            title: "Начать",
                            style: .default,
                            handler: { action in
                                
                                if let number = alert.textFields?.first?.text {
                                    print("\(number)")
                                    if let numberRound = Int(number) {
                                        self.rounds = numberRound
                                    }
                                }
                                let vc = QuizViewController()
                                
                                self.navigationController?.pushViewController(vc, animated: true)
                                self.tableView.deselectRow(at: indexPath, animated: true)
                                
                                vc.indexPath = indexPath.row
                                vc.rounds = self.rounds
                            }))
        alert.addAction(UIAlertAction(
                            title: "Отмена",
                            style: .cancel,
                            handler: nil
            ))
                        self.present(
                            alert,
                            animated: true)
    }
}

extension QuizTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idQuizCell, for: indexPath) as! QuizTableViewCell
        cell.textLabel?.text = "\(quizData[indexPath.row].title)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        gameAlertIsStart(indexPath: indexPath)
    }
}



