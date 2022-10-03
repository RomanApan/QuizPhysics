
import UIKit

class QuizViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollV = UIScrollView()
        scrollV.translatesAutoresizingMaskIntoConstraints = false
        scrollV.backgroundColor = .white
        return scrollV
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "Apple SD Gothic Neo", size: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .white
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var button1: UIButton = {
        let button1 = UIButton()
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.layer.cornerRadius = 15
        button1.titleLabel?.lineBreakMode = .byWordWrapping
        button1.titleLabel?.textAlignment = .center
        button1.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        button1.backgroundColor = .black
        return button1
    }()
    
    lazy var button2: UIButton = {
        let button2 = UIButton()
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.layer.cornerRadius = 15
        button2.titleLabel?.textAlignment = .center
        button2.titleLabel?.lineBreakMode = .byWordWrapping
        button2.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        button2.backgroundColor = .black
        return button2
    }()
    
    lazy var button3: UIButton = {
        let button3 = UIButton()
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.layer.cornerRadius = 15
        button3.titleLabel?.textAlignment = .center
        button3.titleLabel?.lineBreakMode = .byWordWrapping
        button3.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        button3.backgroundColor = .black
        return button3
    }()
    
    lazy var button4: UIButton = {
        let button4 = UIButton()
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.layer.cornerRadius = 15
        button4.titleLabel?.textAlignment = .center
        button4.titleLabel?.lineBreakMode = .byWordWrapping
        button4.titleLabel?.font = UIFont(name: "Apple SD Gothic Neo", size: 15)
        button4.backgroundColor = .black
        return button4
    }()
    
    var indexPath: Int = 0
    var rounds: Int = 0
    var model: QuizModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        setContsraints()
        
        model = QuizModel(rounds: rounds, buttonFirst: button1, buttonSecond: button2, buttonThird: button3, buttonFourth: button4, view: view, label: label, scrollView: scrollView, cellIndexPath: indexPath)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let btnSendTag: UIButton = sender
        model.haveScore(answer: String(btnSendTag.tag))
        if model.isGameEnded {
            gameAlertIsEnd(newScore: model.score)
        } else {
            model.startNewRound()
        }
    }
    
    func setContsraints() {
        
        view.addSubview(button4)
        button4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button4.tag = 4
        NSLayoutConstraint.activate([
            button4.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            button4.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            button4.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            button4.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        view.addSubview(button3)
        button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button3.tag = 3
        NSLayoutConstraint.activate([
            button3.bottomAnchor.constraint(equalTo: button4.topAnchor, constant: -10),
            button3.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            button3.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            button3.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        view.addSubview(button2)
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button2.tag = 2
        NSLayoutConstraint.activate([
            button2.bottomAnchor.constraint(equalTo: button3.topAnchor, constant: -10),
            button2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            button2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            button2.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        view.addSubview(button1)
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button1.tag = 1
        NSLayoutConstraint.activate([
            button1.bottomAnchor.constraint(equalTo: button2.topAnchor, constant: -10),
            button1.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            button1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            button1.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: button1.topAnchor, constant: -10)
        ])
        
        scrollView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            containerView.widthAnchor.constraint(equalToConstant: self.view.safeAreaLayoutGuide.layoutFrame.width)
        ])
        
        containerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])
        
        containerView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
            
        ])
    }
    
    // функция по вызову оповещения о конце игры
    private func gameAlertIsEnd(newScore: Int) {
        
        var zadanie = "вопрос"
        
        if newScore == 1 {
            zadanie = "вопрос"
        } else if newScore >= 2 && newScore <= 4 {
            zadanie = "вопроса"
        } else {
            zadanie = "вопросов"
        }
        
        let alert = UIAlertController(
            title: "Тест окончен",
            message: "Вы ответили правильно на \(newScore) \(zadanie), если вы хотите продолжить тестирование, введите колличество вопросов, которое вы хотите решить.",
            preferredStyle: .alert)
        alert.addTextField { textField in
            textField.keyboardType = .numberPad
            textField.placeholder = "Введите число"
        }
        alert.addAction(UIAlertAction(
                            title: "Начать заново",
                            style: .default,
                            handler: { action in
                                self.model.restartGame()

                                if let number = alert.textFields?.first?.text {
                                    print("\(number)")
                                    if let numberRound = Int(number) {
                                        self.model.roundsCount = numberRound
                                    }
                                }
                            }

            ))
        alert.addAction(UIAlertAction(
                            title: "Назад",
                            style: .cancel,
                            handler: { action in
                                self.navigationController?.popViewController(animated: true)
                            }
            ))
                        self.present(
                            alert,
                            animated: true,
                            completion: nil)
    }
}
