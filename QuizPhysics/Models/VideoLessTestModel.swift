
import UIKit

protocol VideoLessTestProtocol{
    // Количество заработанных очков
    var score: Int { get  }
    // Проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд
    func startNewRound()
    // функция добавления очков
    func haveScore(answer: String)
    // Контроль очков
    var rounds: Array<Int> { get }
    // Колличество раундов
    var roundsCount: Int { get }
    
    // кнопки
    var buttonFirst: UIButton { get }
    var buttonSecond: UIButton { get }
    var buttonThird: UIButton { get }
    var buttonFourth: UIButton { get }
    
    var label: UILabel { get }
    var scrollView: UIScrollView { get }
    
    // Вью
    var view: UIView { get }
    
    // Номер ячейки
    var cellIndexPath: Int { get }

    
    // Функция заполняющая информацией кнопки и скролВью
    func newInformationInTheBtnNScrl(firstButton: UIButton, secondButton: UIButton, thirdButton: UIButton, fourthButton: UIButton, label: UILabel, scrollView: UIScrollView, cellIndexPath:Int)
}

class VideoLessTestModel: VideoLessTestProtocol {
    
    var cellIndexPath: Int
    
    var quizData: [Categories] = []
    
    var rounds: Array<Int> = []
    
    var roundsCount: Int
    
    var buttonFirst: UIButton
    var buttonSecond: UIButton
    var buttonThird: UIButton
    var buttonFourth: UIButton
    
    var label: UILabel
    var scrollView: UIScrollView
    
    var view: UIView
    
    var nameFile: String = ""
    
    init(rounds: Int, buttonFirst: UIButton, buttonSecond: UIButton, buttonThird: UIButton, buttonFourth: UIButton, view: UIView, label: UILabel, scrollView: UIScrollView, cellIndexPath: Int, videoId: String) {
        
        self.cellIndexPath = cellIndexPath
        self.buttonFirst = buttonFirst
        self.buttonSecond = buttonSecond
        self.buttonThird = buttonThird
        self.buttonFourth = buttonFourth
        self.view = view
        self.scrollView = scrollView
        self.label = label
        roundsCount = rounds
        
        if videoId == "tQpjz9x-o0Y" {
            nameFile = "dataVideoFizikaTest"
        } else if videoId == "BOtzWyBX34I" {
            nameFile = "dataVideoFizikaTestPaskal"
        } else if videoId == "qtj64yv6lYI" {
            nameFile = "dataVideoFizikaTestNasos"
        } else if videoId == "u0ZCr0JT8EM" {
            nameFile = "dataVideoFizikaTestArchimed"
        }
        
        if let localData = self.readLocalFile(forName: nameFile) {
            self.parse(jsonData: localData, &quizData)
            
            startNewRound()
        }
    }
    
    func haveScore(answer: String) {
        if answer == self.quizData[cellIndexPath].categor[rounds.count].win {
            rounds.append(1)
        } else {
            rounds.append(0)
        }
    }
    
    var score: Int {
        var totalScore: Int = 0
        for scoreFromRounds in self.rounds {
            totalScore += scoreFromRounds
        }
        return totalScore
    }
    
    var isGameEnded: Bool {
        if roundsCount <= rounds.count {
            return true
        } else {
            return false
        }
    }
    
    func startNewRound() {
        self.newInformationInTheBtnNScrl(firstButton: buttonFirst, secondButton: buttonSecond, thirdButton: buttonThird, fourthButton: buttonFourth, label: label, scrollView: scrollView, cellIndexPath: cellIndexPath)
    }
    
    func restartGame() {
        rounds = []
        self.startNewRound()
    }
    
    func newInformationInTheBtnNScrl(firstButton: UIButton, secondButton: UIButton, thirdButton: UIButton, fourthButton: UIButton, label: UILabel, scrollView: UIScrollView, cellIndexPath: Int) {
        
        firstButton.setTitle("\(self.quizData[cellIndexPath].categor[rounds.count].button1)", for: .normal)
        secondButton.setTitle("\(self.quizData[cellIndexPath].categor[rounds.count].button2)", for: .normal)
        thirdButton.setTitle("\(self.quizData[cellIndexPath].categor[rounds.count].button3)", for: .normal)
        fourthButton.setTitle("\(self.quizData[cellIndexPath].categor[rounds.count].button4)", for: .normal)
        
        label.text = self.quizData[cellIndexPath].categor[rounds.count].question
    }
}

extension VideoLessTestModel {
    
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
}
